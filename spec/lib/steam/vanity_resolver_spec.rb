require 'spec_helper'
require 'steam/vanity_resolver'

describe Steam::VanityResolver, :vcr do
  let(:resolver) {Steam::VanityResolver.new}
  let(:valid_vanity_url) {"UberMouse"}
  let(:invalid_vanity_url){"UUbbeerrMmoouussee"}
  let(:steam_id){"76561197994157624"}

  it 'returns the SteamID64 for a user when given a valid vanity url' do
    expect(resolver.call(valid_vanity_url)).to eq(steam_id)
  end

  it 'returns nil if passed an invalid vanity url' do
    expect(resolver.call(invalid_vanity_url)).to be_nil
  end

  it 'returns the same SteamID if it is passed a SteamID instead of a vanity url' do
    expect(resolver.call(steam_id)).to eq(steam_id)
  end

end
