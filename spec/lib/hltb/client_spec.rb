require 'spec_helper'
require 'hltb/client'

describe HLTB::Client, :vcr do
  let(:client) {HLTB::Client.new}
  let(:single_result) {build(:braid)}
  let(:multi_result) {build(:metal_gear_rising)}

  describe "#lookup" do
    context "A game with a single result" do
      it 'returns an HLTB::Game result for the game' do
        expect(client.lookup('Braid')).to eq(single_result)
      end
    end

    context "A game with multiple results" do
      it 'returns an HLTB::Game result for game with a matching name' do
        expect(client.lookup('Metal Gear Rising: Revengeance')).to eq(multi_result)
      end
    end

    context "Edge cases" do
      it 'retrieves games with apostrophes in the name' do
        expect(client.lookup("Sid Meier's Civilization IV")).to eq(build(:civ_iv))
      end

      it 'retrieves GOTY editions' do
        expect(client.lookup('Batman: Arkham Asylum GOTY Edition')).to eq(build(:batman_arkham_asylum))
      end

      it 'retrieves Steam Editions' do
        expect(client.lookup('Red Faction Guerrilla Steam Edition')).to eq(build(:red_faction_guerrilla))
      end

      it 'retrieves games with trailing punctuation that is not stripped out' do
        expect(client.lookup('Fallout 3 - Game of the Year Edition')).to eq(build(:fallout_3))
      end

      it 'retrieves games with decimal separators' do
        expect(client.lookup('Warhammer 40,000: Dawn of War - Winter Assault')).to eq(build(:w40k_winter_assault))
      end

      it 'retrieves games with copyright symbols' do
        expect(client.lookup('Sleeping Dogs™')).to eq(build(:sleeping_dogs))
      end

      it 'retrieves games with hyphenated titles' do
        expect(client.lookup('Half-Life 2: Episode One')).to eq(build(:hl2_ep1))
      end
    end
  end
end
