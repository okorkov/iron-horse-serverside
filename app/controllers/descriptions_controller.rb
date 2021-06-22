class DescriptionsController < ApplicationController

  def update
    desc = Description.find_by(image_id: params[:description][:image_id])
    desc.update(content:params[:description][:content])
    if params[:description][:redirect] == 'project'
      redirect_to edit_project_pic_path
    else
      redirect_to edit_wood_pic_path
    end
  end

  private

end