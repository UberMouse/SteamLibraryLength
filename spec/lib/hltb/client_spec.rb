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
      it 'retrieves Civilization IV' do
        expect(client.lookup("Sid Meier's Civilization IV")).to eq(build(:civ_iv))
      end

      it 'retrieves Batman: Arkham Asylum GOTY Edition' do
        expect(client.lookup('Batman: Arkham Asylum GOTY Edition')).to eq(build(:batman_arkham_asylum))
      end
    end
  end
end
