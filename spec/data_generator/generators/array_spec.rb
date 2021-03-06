require 'spec_helper'

module DataGenerator
  class Generators
    describe Array do

      describe '.generate_value_for' do

        let(:generated_array) { described_class.generate_value_for(object, attribute) }
        let(:object) { 'something' }
        let(:attribute) { { 'id' => 'array_property', 'type' => 'array', 'items' => items } }

        context 'when the items in the array have a single schema' do

          let(:items) { { 'type' => 'string' } }

          it 'generates an array when the property type is array' do
            expect(generated_array).to be_an(::Array)
          end

          it 'sets the type of each element in the array to the type specified in the schema' do
            expect(generated_array).to all(be_a(::String))
          end

          context 'when the type is object' do

            let(:items) { { 'type' => 'object', 'properties' => { 'id' => { 'type' => 'integer' } } } }

            it 'generates an array when the property type is array' do
              expect(generated_array).to be_an(::Array)
            end

            it 'sets the type of each element in the array to the type specified in the schema' do
              expect(generated_array.map { |a| a['id'] }).to all(be_a(::Integer))
            end
          end
        end

        context 'when the items in the array have a schema for each element' do

          let(:items) { [{ 'type' => 'string' }, { 'type' => 'integer' }, { 'type' => 'number' }] }

          it 'generates an array when the property type is array' do
            expect(generated_array).to be_an(::Array)
          end

          it 'sets the type of each element in the array to the types specified in the schema' do
            expect(generated_array[0]).to be_a(::String)
            expect(generated_array[1]).to be_an(::Integer)
            expect(generated_array[2]).to be_a(Float)
          end

          context 'when the item type contains an object' do

            let(:items) { [{ 'type' => 'string' }, { 'type' => 'object', 'properties' => { 'available' => { 'type' => 'boolean' } } }] }

            it 'generates an array when the property type is array' do
              expect(generated_array).to be_an(::Array)
            end

            it 'sets the type of each element in the array to the type specified in the schema for the non-object' do
              expect(generated_array[0]).to be_a(::String)
            end

            it 'sets the type of each element in the array to the type specified in the schema for the object' do
              expect(generated_array[1]['available']).to eq(true).or(eq(false))
            end
          end
        end
      end

    end
  end
end