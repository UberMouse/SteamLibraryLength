class StaticController < ActionController::Base
  def index
    @path = params[:path] || "/"
    render :index, layout: 'application'
  end
end
