class UserController < ApplicationController
  def resolve_user
    trigger_success({steamId: message[:userInfo]})
  end
end
