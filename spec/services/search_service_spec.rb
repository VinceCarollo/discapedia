require 'rails_helper'

RSpec.describe SearchService do
  describe '.call' do
    let(:result) { described_class.call(query:, sort_by:, sort_direction:) }

    let!(:discs) { create_list(:disc, 3) }
    let(:sort_by) { 'name' }
    let(:sort_direction) { 'asc' }

    describe 'with valid params' do
      describe 'when querying multiple discs' do
        let(:query) { 'disc' }

        it 'returns discs grouped by manufacturer' do
          expect(result).to eq(discs.group_by(&:manufacturer))
        end

        describe 'when sorting' do
          describe 'by speed' do
            let(:sort_by) { 'speed' }

            it 'returns discs sorted by speed' do
              expect(result.values.flatten.map(&:speed)).to eq(discs.map(&:speed).sort)
            end
          end

          describe 'by glide' do
            let(:sort_by) { 'glide' }

            it 'returns discs sorted by glide' do
              expect(result.values.flatten.map(&:glide)).to eq(discs.map(&:glide).sort)
            end
          end

          describe 'by turn' do
            let(:sort_by) { 'turn' }

            it 'returns discs sorted by turn' do
              expect(result.values.flatten.map(&:turn)).to eq(discs.map(&:turn).sort)
            end
          end

          describe 'by fade' do
            let(:sort_by) { 'fade' }

            it 'returns discs sorted by fade' do
              expect(result.values.flatten.map(&:fade)).to eq(discs.map(&:fade).sort)
            end
          end

          describe 'in descending order' do
            let(:sort_by) { 'name' }
            let(:sort_direction) { 'desc' }

            it 'returns discs sorted in descending order' do
              expect(result.values.flatten.map(&:name)).to eq(discs.map(&:name).sort.reverse)
            end
          end
        end
      end

      describe 'when querying a single disc' do
        let(:query) { discs.first.name }

        it 'returns only that disc grouped by manufacturer' do
          expect(result).to eq(discs.first.manufacturer => [discs.first])
        end
      end
    end

    describe 'with invalid params' do
      describe 'with no query' do
        let(:query) { '' }

        it 'raises an error' do
          expect { result }.to raise_error(ArgumentError, "Query can't be blank")
        end
      end

      describe 'with bad sort_by' do
        let(:query) { 'Disc' }
        let(:sort_by) { 'bad' }

        it 'raises an error' do
          expect { result }.to raise_error(ArgumentError, 'Sort by is not included in the list')
        end
      end

      describe 'with bad sort_direction' do
        let(:query) { 'Disc' }
        let(:sort_direction) { 'bad' }

        it 'raises an error' do
          expect { result }.to raise_error(ArgumentError, 'Sort direction is not included in the list')
        end
      end
    end
  end
end
