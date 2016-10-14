module DataGenerator
  class Generators
    class Array < Base

      DEFAULT_NUMBER_OF_ARRAY_ITEMS = 3

      def self.generate_value_for(object, attribute)
        items = attribute['items']
        value = []

        if items.is_a?(Hash)
          DEFAULT_NUMBER_OF_ARRAY_ITEMS.times { value << generate_values_for(object, items) }
        elsif items.is_a?(::Array)
          items.each { |item| value << generate_values_for(object, item) }
        end

        value
      end


      private

      def self.generate_values_for(object, item)
        if item['type'] == 'object'
          result = {}

          item['properties'].each do |object, item|
            result[object] = generate_values_for(object, item)
          end

          result
        else
          generator = Locator.new.locate_generator_for(item['type'])
          generator.generate_value_for(object, item)
        end
      end

    end
  end
end