require 'faker'

module DataGenerator
  class Generators
    class Integer < Base

      def self.generate_value_for(object, attribute)
        Faker::Number.number(4).to_i
      end

    end
  end
end