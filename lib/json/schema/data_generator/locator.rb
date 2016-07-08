require 'json/schema/data_generator/generators/base'
require 'json/schema/data_generator/generators/string'
require 'json/schema/data_generator/generators/integer'
require 'json/schema/data_generator/generators/number'
require 'json/schema/data_generator/generators/boolean'
require 'json/schema/data_generator/generators/null'
require 'json/schema/data_generator/generators/array'
require 'active_support/inflector'

module JSON
  class Schema
    class DataGenerator
      class Locator

        def locate_generator_for(type)
          "JSON::Schema::DataGenerator::Generators::#{type.camelize}".constantize
        end

      end
    end
  end
end
