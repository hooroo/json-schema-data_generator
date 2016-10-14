require 'spec_helper'

module DataGenerator
  class Generators
    describe String do

      describe '.generate_value_for' do

        let(:generated_string) { described_class.generate_value_for(object, attribute) }
        let(:object) { 'something' }
        let(:attribute) { { 'id': 'string_property', 'type': 'string' } }

        it 'returns a string' do
          expect(generated_string).to be_a(::String)
        end

        describe 'special cases' do

          context 'when it is an id' do

            let(:object) { 'id' }

            it 'returns a uuid' do
              expect(generated_string).to match(/^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i)
            end
          end

          context 'when it is an amount' do

            let(:object) { 'amount' }

            it 'returns a string with two decimal places' do
              expect(generated_string).to match(/[0-9]+\.[0-9]{2}/)
            end
          end

          context 'when it is a currency' do

            let(:object) { 'currency' }

            it 'returns AUD' do
              expect(generated_string).to eq('AUD')
            end
          end

          context 'when it is an email' do

            let(:object) { 'email' }

            it 'returns AUD' do
              expect(generated_string).to match(/.+@.+/)
            end
          end
        end
      end

    end
  end
end