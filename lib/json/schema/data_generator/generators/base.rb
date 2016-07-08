module JSON
  module Schema
    module DataGenerator
      module Generators
        class Base

          def self.generate_value_for(attribute)
            raise NotImplementedError.new, "the 'generate_value_for' method must be defined in a subclass"
          end

        end
      end
    end
  end
end