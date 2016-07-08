require 'json'
require 'json-schema'
require 'json/schema/data_generator/locator'

module JSON
  class Schema
    class DataGenerator
      class Generator

        def initialize(schema:, generator_locator: Locator.new, options: {})
          @schema = JSON::Schema.new(schema, Addressable::URI.parse(schema[:id]))
          @generator_locator = generator_locator
          @options = options
        end

        def generate
          schema.schema[:properties].inject({}) do |hsh, (object, attributes)|
            hsh[object] = generate_values_for(attributes)
            hsh
          end
        end


        private

        attr_reader :schema, :generator_locator, :options

        def generate_values_for(attributes)
          attributes[:properties].inject({}) do |hsh, (object, attribute)|
            hsh[object] = attribute[:type] == 'object' ? generate_values_for(attribute) : generate_value_for(attribute)
            hsh
          end
        end

        def generate_value_for(attribute)
          generator = generator_locator.locate_generator_for(attribute[:type])
          generator.generate_value_for(attribute)
        end

      end
    end
  end
end
