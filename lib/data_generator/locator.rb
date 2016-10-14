require 'data_generator/generators/base'
require 'data_generator/generators/string'
require 'data_generator/generators/integer'
require 'data_generator/generators/number'
require 'data_generator/generators/boolean'
require 'data_generator/generators/null'
require 'data_generator/generators/array'
require 'active_support/inflector'

module DataGenerator
  class Locator

    class InvalidTypeError < StandardError; end

    VALID_TYPES = ['string', 'integer', 'number', 'boolean', 'array', 'null'].freeze

    def locate_generator_for(type)
      raise InvalidTypeError, "'#{type}' is not a valid type" unless VALID_TYPES.include?(type)

      eval("DataGenerator::Generators::#{type.camelize}")
      # "DataGenerator::Generators::#{type.camelize}".constantize
    end

  end
end