require 'json-schema/util/uri'
require 'json/schema/data_generator/generators/string'
require 'json/schema/data_generator/generators/integer'
require 'json/schema/data_generator/generators/number'
require 'json/schema/data_generator/generators/boolean'
require 'json/schema/data_generator/generators/array'
require 'byebug'

module JSON
  module Schema
    module DataGenerator
      class Generator

        def initialize(schema:, options: {})
          @schema = schema
          @options = options
        end

        def generate
          data = {}

          schema[:properties].each do |object, attributes|
            data[object] = generate_data_for(attributes)
          end

          data
        end


        private

        def generate_data_for(attributes)
          result = {}

          attributes[:properties].each do |object, attribute|
            result[object] = case attribute[:type]
              when 'object'
                generate_data_for(attribute)
              when 'string'
                Generators::String.generate
              when 'integer'
                Generators::Integer.generate
              when 'number'
                Generators::Number.generate
              when 'boolean'
                Generators::Boolean.generate
              when 'array'
                Generators::Array.generate(attribute)
            end
          end

          result
        end


        private

        attr_reader :schema, :options

      end
    end
  end
end
