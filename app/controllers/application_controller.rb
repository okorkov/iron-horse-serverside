class ApplicationController < ActionController::Base

  before_action :define_admin, :info_store, :require_login
  
  include ApplicationHelper

  

end
