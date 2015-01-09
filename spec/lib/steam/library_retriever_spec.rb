require 'spec_helper'
require 'steam/library_retriever'

describe Steam::LibraryRetriever, :vcr do
  let(:steam_id) {"76561197994157624"}
  let(:retriever) {Steam::LibraryRetriever.new}
  let(:first_game) {build(:dods)}
  let(:last_game) {build(:ziggurat)}
  

  it 'returns a list of a users games when called' do
    games = retriever.call(steam_id)

    expect(games.length).to eq(361)
    expect(games.first).to eq(first_game)
    expect(games.last).to eq(last_game)
  end
end
