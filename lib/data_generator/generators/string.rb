require 'faker'

module DataGenerator
  class Generators
    class String < Base

      SPECIAL_CASES = ['id', 'amount', 'currency', 'email'].freeze

      def self.generate_value_for(object, attribute)
        if SPECIAL_CASES.include?(object)
          send(object)
        else
          Faker::Lorem.sentence
        end
      end


      private

      def self.id
        SecureRandom.uuid
      end

      def self.amount
        Faker::Number.decimal(3, 2)
      end

      def self.currency
        'AUD'
      end

      def self.email
        Faker::Internet.free_email
      end

    end
  end
end