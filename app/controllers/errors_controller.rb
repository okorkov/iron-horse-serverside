class ErrorsController < ApplicationController
  def not_found
    redirect_to root_path
  end
end