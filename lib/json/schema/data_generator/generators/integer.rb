require 'faker'

module JSON
  module Schema
    module DataGenerator
      module Generators
        class Integer

          def self.generate
            Faker::Number.number(4).to_i
          end

        end
      end
    end
  end
end