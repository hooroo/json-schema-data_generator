require 'faker'

module JSON
  module Schema
    module DataGenerator
      module Generators
        class Number < Base

          def self.generate_value_for(attribute)
            Faker::Number.decimal(3, 2).to_f
          end

        end
      end
    end
  end
end