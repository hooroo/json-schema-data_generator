require 'spec_helper'

module JSON
  class Schema
    class DataGenerator
      class Generators
        describe Null do

          describe '.generate_value_for' do

            let(:generated_null) { described_class.generate_value_for(attribute) }
            let(:attribute) { { 'id': 'null_property', 'type': 'null' } }

            it 'returns nil' do
              expect(generated_null).to be_nil
            end
          end

        end
      end
    end
  end
end