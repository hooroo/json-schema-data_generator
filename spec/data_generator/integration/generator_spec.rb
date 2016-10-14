require 'spec_helper'

module DataGenerator
  describe Generator do

    subject(:generator) { described_class.new(schema: schema) }

    let(:schema) do
      {
        '$schema' => 'http://json-schema.org/draft-04/schema#',
        'id' => 'http://json-schemas.example.com/schemas.json',
        'type' => 'object',
        'properties' => {
          'parent_object' => {
            'id' => 'parent_object',
            'type' => 'object',
            'properties' => {
              'string_property' => { 'id' => 'string_property', 'type' => 'string' },
              'integer_property' => { 'id' => 'integer_property', 'type' => 'integer' },
              'number_property' => { 'id' => 'number_property', 'type' => 'number' },
              'boolean_property' => { 'id' => 'boolean_property', 'type' => 'boolean' },
              'null_property' => { 'id' => 'null_property', 'type' => 'null' },
              'array_property' => { 'id' => 'array_property', 'type' => 'array', 'items' => array_property_items },
              'nested_object' => {
                'id' => 'nested_object',
                'description' => 'This object is nested',
                'type' => 'object',
                'properties' => {
                  'nested_string_property' => { 'id' => 'nested_string_property', 'type' => 'string' },
                  'nested_integer_property' => { 'id' => 'nested_integer_property', 'type' => 'integer' }
                }
              }
            }
          }
        }
      }
    end

    let(:array_property_items) { { 'type' => 'string' } }

    describe '#generate' do

      let(:generated_data) { generator.generate }

      context 'when the given schema has no properties' do

        let(:schema) do
          {
            '$schema' => 'http://json-schema.org/draft-04/schema#',
            'id' => 'http://json-schemas.example.com/schemas.json',
            'type' => 'object'
          }
        end

        it 'returns an empty hash' do
          expect(generated_data).to eq({})
        end
      end

      context 'when the given schema is valid' do

        it 'generates a string when the property type is string' do
          expect(generated_data['parent_object']['string_property']).to be_a(String)
        end

        it 'generates an integer when the property type is integer' do
          expect(generated_data['parent_object']['integer_property']).to be_an(Integer)
        end

        it 'generates a number when the property type is number' do
          expect(generated_data['parent_object']['number_property']).to be_a(Float)
        end

        it 'generates a boolean when the property type is boolean' do
          expect(generated_data['parent_object']['boolean_property']).to eq(true).or(eq(false))
        end

        it 'generates nil when the property type is null' do
          expect(generated_data['parent_object']['null_property']).to be_nil
        end

        describe 'generating an array' do

          let(:generated_array) { generated_data['parent_object']['array_property'] }

          context 'when the items property of the attribute has a single schema' do

            let(:array_property_items) { { 'type' => 'string' } }

            it 'generates an array' do
              expect(generated_array).to be_an(Array)
            end
          end

          context 'when the items property in the array has a schema for each element' do

            let(:array_property_items) { [{ 'type' => 'string' }, { 'type' => 'integer' }, { 'type' => 'number' }] }

            it 'generates an array' do
              expect(generated_array).to be_an(Array)
            end
          end
        end

        describe 'generating nested objects' do

          it 'generates data for a nested object when the property type is object' do
            expect(generated_data['parent_object']['nested_object']).to_not be_nil
          end

          it 'generates a string when the nested property type is string' do
            expect(generated_data['parent_object']['nested_object']['nested_string_property']).to be_a(String)
          end

          it 'generates an integer when the nested property type is integer' do
            expect(generated_data['parent_object']['nested_object']['nested_integer_property']).to be_an(Integer)
          end
        end
      end

      # pending 'when the given schema is invalid' do

      #   it 'raises an error' do
      #     expect(generated_data).to raise_error(InvalidSchema)
      #   end
      # end
    end
  end
end
