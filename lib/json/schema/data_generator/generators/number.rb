require 'faker'

module JSON
  module Schema
    module DataGenerator
      module Generators
        class Number

          def self.generate
            Faker::Number.decimal(3, 2).to_f
          end

        end
      end
    end
  end
end