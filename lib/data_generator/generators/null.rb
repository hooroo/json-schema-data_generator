module DataGenerator
  class Generators
    class Null < Base

      def self.generate_value_for(object, attribute)
        nil
      end

    end
  end
end