module JSON
  module Schema
    module DataGenerator
      module Generators
        class Array

          def self.generate(attribute)
            byebug
            arr = []

            if attribute[:items].is_a?(Array)
              val = case attribute[:items][:type]
                when 'string'
                  'cool string!'
                when 'integer'
                  42
                when 'number'
                  17.62
                when 'boolean'
                  [true, false].sample
              end

              3.times { |n| arr << val }

            elsif attribute[:items].is_a?(Array)
              attribute[:items].each do |item|
                arr << case item[:type]
                  when 'string'
                    'cool string!'
                  when 'integer'
                    42
                  when 'number'
                    17.62
                  when 'boolean'
                    [true, false].sample
                end
              end
            end

            arr
          end

        end
      end
    end
  end
end