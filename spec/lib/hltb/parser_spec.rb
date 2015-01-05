require 'spec_helper'
require 'hltb/parser'

describe HLTB::Parser do
  let(:search_result) {File.read('spec/lib/hltb/search_result.html')}
  let(:no_search_results) {File.read('spec/lib/hltb/no_search_results.html')}
  let(:parser) {HLTB::Parser.new(search_result)}
  let(:empty_parser) {HLTB::Parser.new(no_search_results)}
  let(:invalid_parser) {HLTB::Parser.new('garbageinput1920388oi')}
  let(:multi_search_result) {[build(:metal_gear_rising), build(:metal_gear_blade_wolf), build(:metal_gear_jetstream)]}

  it 'throws an exception if it is initialized with no data' do
    expect{HLTB::Parser.new}.to raise_error(ArgumentError)
  end

  describe '#call' do
    context 'the search_result is valid' do
      context 'there are search results' do
        it 'returns an array containing parsed HLTBGame results' do
          expect(parser.call).to eq(multi_search_result) 
        end
      end

      context 'there are no search results' do
        it 'returns an empty array' do
          expect(empty_parser.call).to eq([])
        end
      end
    end
  end

  context 'the search_result is invalid' do
    it 'throws an argument error' do
      expect{invalid_parser}.to raise_error(ArgumentError)
    end
  end
end
