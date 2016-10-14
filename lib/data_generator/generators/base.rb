module DataGenerator
  class Generators
    class Base

      def self.generate_value_for(object, attribute)
        raise NotImplementedError.new, "the 'generate_value_for' method must be defined in a subclass"
      end

    end
  end
end