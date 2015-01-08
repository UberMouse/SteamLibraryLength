class UserController < ApplicationController
  def resolve_user
    steam_id = SteamVanityResolver.new.call(message[:user_info])

    if steam_id.nil?
      trigger_failure({message: 'Steam vanity name invalid'})
    else
      trigger_success({steam_id: steam_id})
    end
  end
end
