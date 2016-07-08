require 'spec_helper'

module JSON
  module Schema
    module DataGenerator
      module Generators
        describe Integer do

          describe '.generate_value_for' do

            let(:generated_integer) { described_class.generate_value_for(attribute) }
            let(:attribute) { { 'id': 'integer_property', 'type': 'integer' } }

            it 'returns an integer' do
              expect(generated_integer).to be_an(::Integer)
            end
          end

        end
      end
    end
  end
end