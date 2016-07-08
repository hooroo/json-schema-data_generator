require 'faker'

module JSON
  class Schema
    class DataGenerator
      class Generators
        class String < Base

          def self.generate_value_for(attribute)
            Faker::Lorem.sentence
          end

        end
      end
    end
  end
end