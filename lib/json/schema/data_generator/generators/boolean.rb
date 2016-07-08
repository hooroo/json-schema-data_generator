module JSON
  module Schema
    module DataGenerator
      module Generators
        class Boolean < Base

          def self.generate_value_for(attribute)
            [true, false].sample
          end

        end
      end
    end
  end
end