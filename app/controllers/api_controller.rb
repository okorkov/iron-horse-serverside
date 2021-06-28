class ApiController < ApplicationController

  skip_before_action :require_login

  caches_page :index
  
  def index
    json = Rails.cache.fetch('posts') do
    Info.cache_api
    end
    
    render json: json
  end

end