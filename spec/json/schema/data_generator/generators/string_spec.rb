require 'spec_helper'

module JSON
  module Schema
    module DataGenerator
      module Generators
        describe String do

          describe '.generate_value_for' do

            let(:generated_string) { described_class.generate_value_for(attribute) }
            let(:attribute) { { 'id': 'string_property', 'type': 'string' } }

            it 'returns a string' do
              expect(generated_string).to be_a(::String)
            end
          end

        end
      end
    end
  end
end