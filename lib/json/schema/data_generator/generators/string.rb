require 'faker'

module JSON
  module Schema
    module DataGenerator
      module Generators
        class String < Base

          def self.generate_value_for(attribute)
            Faker::Lorem.sentence
          end

        end
      end
    end
  end
end