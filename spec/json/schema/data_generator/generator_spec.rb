require 'spec_helper'

module JSON
  module Schema
    module DataGenerator
      describe Generator do

        subject(:generator) { described_class.new(schema: schema) }

        let(:schema) do
          {
            "$schema": "http://json-schema.org/draft-04/schema#",
            "id": "http://json-schemas.example.com/schemas.json",
            "type": "object",
            "properties": {
              "parent_object": {
                "id": "parent_object",
                "type": "object",
                "properties": {
                  "string_property": {
                    "id": "string_property",
                    "type": "string"
                  },
                  "integer_property": {
                    "id": "integer_property",
                    "type": "integer"
                  },
                  "number_property": {
                    "id": "number_property",
                    "type": "number"
                  },
                  "boolean_property": {
                    "id": "boolean_property",
                    "type": "boolean"
                  },
                  "null_property": {
                    "id": "null_property",
                    "type": "null"
                  },
                  "array_property": {
                    "id": "array_property",
                    "type": "array",
                    "items": array_items_schema
                  },
                  "nested_object": {
                    "id": "nested_object",
                    "description": "This object is nested",
                    "type": "object",
                    "properties": {
                      "nested_string_property": {
                        "id": "nested_string_property",
                        "type": "string"
                      },
                      "nested_integer_property": {
                        "id": "nested_integer_property",
                        "type": "integer"
                      }
                    }
                  }
                }
              }
            }
          }
        end

        let(:array_items_schema) do
          {
            "type": "string"
          }
        end

        describe '#generate' do

          let(:generated_data) { generator.generate }

          context 'when the given schema is valid' do

            it 'generates a string when the property type is string' do
              expect(generated_data[:parent_object][:string_property]).to be_a(String)
            end

            it 'generates an integer when the property type is integer' do
              expect(generated_data[:parent_object][:integer_property]).to be_an(Integer)
            end

            it 'generates a number when the property type is number' do
              expect(generated_data[:parent_object][:number_property]).to be_a(Float)
            end

            it 'generates a boolean when the property type is boolean' do
              expect(generated_data[:parent_object][:boolean_property]).to eq(true).or(eq(false))
            end

            it 'generates nil when the property type is null' do
              expect(generated_data[:parent_object][:null_property]).to be_nil
            end

            describe 'generating an array' do

              context 'when the items in the array have a single schema' do

                it 'generates an array when the property type is array' do
                  expect(generated_data[:parent_object][:array_property]).to be_an(Array)
                end

                it 'sets the type of each element in the array to the type specified in the schema' do
                  expect(generated_data[:parent_object][:array_property]).to all(be_a(String))
                end
              end

              context 'when the items in the array have a schema for each element' do

                let(:array_items_schema) do
                  [
                    {
                      "type": "string"
                    },
                    {
                      "type": "integer"
                    },
                    {
                      "type": "number"
                    }
                  ]
                end

                it 'generates an array when the property type is array' do
                  expect(generated_data[:parent_object][:array_property]).to be_an(Array)
                end

                it 'sets the type of each element in the array to the types specified in the schema' do
                  expect(generated_data[:parent_object][:array_property][0]).to be_a(String)
                  expect(generated_data[:parent_object][:array_property][1]).to be_an(Integer)
                  expect(generated_data[:parent_object][:array_property][2]).to be_a(Float)
                end
              end
            end

            describe 'generating nested objects' do

              it 'generates data for a nested object when the property type is object' do
                expect(generated_data[:parent_object][:nested_object]).to_not be_nil
              end

              it 'generates a string when the nested property type is string' do
                expect(generated_data[:parent_object][:nested_object][:nested_string_property]).to be_a(String)
              end

              it 'generates an integer when the nested property type is integer' do
                expect(generated_data[:parent_object][:nested_object][:nested_integer_property]).to be_an(Integer)
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
  end
end
