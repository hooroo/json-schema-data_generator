module JSON
  module Schema
    module DataGenerator
      module Generators
        class Array < Base

          # TODO: handle length and uniqueness constraints

          DEFAULT_NUMBER_OF_ARRAY_ITEMS = 3

          def self.generate_value_for(attribute)
            items = attribute[:items]
            value = []

            if items.is_a?(Hash)
              DEFAULT_NUMBER_OF_ARRAY_ITEMS.times { value << generate_values_for(items) }
            elsif items.is_a?(::Array)
              items.each { |item| value << generate_values_for(item) }
            end

            value
          end


          private

          def self.generate_values_for(item)
            generator = Locator.new.locate_generator_for(item[:type])
            generator.generate_value_for(item)
          end

        end
      end
    end
  end
end