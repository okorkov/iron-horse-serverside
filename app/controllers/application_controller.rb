class ApplicationController < ActionController::Base

  before_action :define_admin, :info_store
  
  include ApplicationHelper

end
