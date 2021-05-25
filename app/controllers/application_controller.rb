class ApplicationController < ActionController::Base

  before_action :define_admin
  
  include ApplicationHelper
  
end
