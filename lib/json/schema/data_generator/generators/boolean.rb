module JSON
  module Schema
    module DataGenerator
      module Generators
        class Boolean

          def self.generate
            [true, false].sample
          end

        end
      end
    end
  end
end