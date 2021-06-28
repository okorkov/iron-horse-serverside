class ApiController < ApplicationController

  skip_before_action :require_login

  caches_page :index
  
  def index
   render json: Info.cache_api
  end

end