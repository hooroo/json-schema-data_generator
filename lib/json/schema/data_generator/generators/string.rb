require 'faker'

module JSON
  module Schema
    module DataGenerator
      module Generators
        class String

          def self.generate
            Faker::Lorem.sentence
          end

        end
      end
    end
  end
end