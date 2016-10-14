require 'faker'

module DataGenerator
  class Generators
    class Number < Base

      def self.generate_value_for(object, attribute)
        Faker::Number.decimal(3, 2).to_f
      end

    end
  end
end