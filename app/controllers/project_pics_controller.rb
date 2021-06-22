class ProjectPicsController < ApplicationController

  def edit
    @new_description = Description.new
  end

end