class StaticController < ActionController::Base
  def index
    @path = params[:path] || "/"
  end
end
