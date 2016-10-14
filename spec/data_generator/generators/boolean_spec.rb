require 'spec_helper'

module DataGenerator
  class Generators
    describe Boolean do

      describe '.generate_value_for' do

        let(:generated_boolean) { described_class.generate_value_for(object, attribute) }
        let(:object) { 'something' }
        let(:attribute) { { 'id' => 'boolean_property', 'type' => 'boolean' } }

        it 'returns a boolean' do
          expect(generated_boolean).to eq(true).or(eq(false))
        end
      end

    end
  end
end