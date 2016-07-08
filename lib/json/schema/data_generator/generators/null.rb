module JSON
  module Schema
    module DataGenerator
      module Generators
        class Null < Base

          def self.generate_value_for(attribute)
            nil
          end

        end
      end
    end
  end
end