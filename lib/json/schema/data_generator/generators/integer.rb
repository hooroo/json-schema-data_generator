require 'faker'

module JSON
  class Schema
    class DataGenerator
      class Generators
        class Integer < Base

          def self.generate_value_for(attribute)
            Faker::Number.number(4).to_i
          end

        end
      end
    end
  end
end