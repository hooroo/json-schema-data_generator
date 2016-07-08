module JSON
  class Schema
    class DataGenerator
      class Generators
        class Null < Base

          def self.generate_value_for(attribute)
            nil
          end

        end
      end
    end
  end
end