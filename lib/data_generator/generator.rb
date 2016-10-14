require 'json'
require 'json-schema'
require 'data_generator/locator'

module DataGenerator
  class Generator

    def initialize(schema:, generator_locator: Locator.new, options: {})
      @schema = JSON::Schema.new(schema, Addressable::URI.parse(schema['id']))
      @generator_locator = generator_locator
      @options = options
    end

    def generate
      return {} if schema.schema['properties'].nil?

      schema.schema['properties'].inject({}) do |hsh, (object, attributes)|
        hsh[object] = generate_values_for(attributes)
        hsh
      end
    end


    private

    attr_reader :schema, :generator_locator, :options

    def generate_values_for(attributes)
      attributes['properties'].inject({}) do |hsh, (object, attribute)|
        hsh[object] = attribute['type'] == 'object' ? generate_values_for(attribute) : generate_value_for(object, attribute)
        hsh
      end
    end

    def generate_value_for(object, attribute)
      type = attribute['type'].is_a?(Array) ? attribute['type'].sample : attribute['type']
      if type == ''
        puts "--- #{schema}"
      end
      generator = generator_locator.locate_generator_for(type)
      generator.generate_value_for(object, attribute)
    end

  end
end