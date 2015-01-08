class SteamVanityResolver
  def call(vanity_url)
    return vanity_url if is_steamid?(vanity_url)

    steam_id = nil
    begin
      steam_id = Steam::User.vanity_to_steamid vanity_url
    rescue Steam::SteamError
    end

    steam_id
  end

  def is_steamid?(checkee)
    checkee =~ /[0-9]+/
  end
end
