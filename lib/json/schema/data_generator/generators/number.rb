require 'faker'

module JSON
  class Schema
    class DataGenerator
      class Generators
        class Number < Base

          def self.generate_value_for(attribute)
            Faker::Number.decimal(3, 2).to_f
          end

        end
      end
    end
  end
end