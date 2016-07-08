require 'faker'

module JSON
  module Schema
    module DataGenerator
      module Generators
        class Integer < Base

          def self.generate_value_for(attribute)
            Faker::Number.number(4).to_i
          end

        end
      end
    end
  end
end