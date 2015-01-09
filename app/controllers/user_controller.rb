require 'steam/vanity_resolver'

class UserController < ApplicationController
  def resolve_user
    steam_id = Steam::VanityResolver.new.call(message[:vanity_url])

    if steam_id.nil?
      trigger_failure({message: 'Steam vanity name invalid'})
    else
      trigger_success({steam_id: steam_id})
    end
  end
end
