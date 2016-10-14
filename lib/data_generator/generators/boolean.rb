module DataGenerator
  class Generators
    class Boolean < Base

      def self.generate_value_for(object, attribute)
        [true, false].sample
      end

    end
  end
end
