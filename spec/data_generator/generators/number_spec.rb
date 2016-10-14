require 'spec_helper'

module DataGenerator
  class Generators
    describe Number do

      describe '.generate_value_for' do

        let(:generated_number) { described_class.generate_value_for(object, attribute) }
        let(:object) { 'something' }
        let(:attribute) { { 'id': 'number_property', 'type': 'number' } }

        it 'returns a number' do
          expect(generated_number).to be_a(Float)
        end
      end

    end
  end
end