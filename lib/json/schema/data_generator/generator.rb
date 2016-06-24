require 'json-schema/util/uri'

module JSON
  module Schema
    module DataGenerator
      class Generator

        def initialize(schema, opts = {})
          @schema = {"$schema":"http://json-schema.org/draft-04/schema#","id":"http://event-schemas.hooroo.com/bookings/events/booking_blocked/1_0.json","type":"object","properties":{"booking":{"id":"booking","type":"object","properties":{"id":{"id":"id","type":"string"},"booking_reference":{"id":"booking_reference","type":"string"},"my_integer":{"id":"my_integer","type":"integer"}}}}}
          @options = opts
        end

        def generate
          require 'byebug'
          byebug
          parent = {}

          puts "DATA ----------- #{create_data(parent, schema[:properties])}"
        end

        def create_data(parent, hsh)

          hsh.each do |property, value|
            parent[property] = process_properties(value[:properties])
          end

          parent
        end

        def process_properties(properties)
          if properties[:type] == 'object'
            process_properties(properties[:properties])
          else
            properties.each do |property, value|
              case value[:type]
                when 'object'
                  process_properties(properties[:properties])

                when 'integer'
                  'nice int!'

                when 'string'
                  'cool string!'
              end
            end
          end
        end


        private

        attr_reader :schema, :options

      end
    end
  end
end
