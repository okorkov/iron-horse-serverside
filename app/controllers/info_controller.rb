class InfoController < ApplicationController
  def update
    info = Info.all.first
    if params[:info]
      info.update(info_params)
      info.header_img.attach(params[:info][:header_image]) if params[:info][:header_image]
      info.about_img.attach(params[:info][:about_img]) if params[:info][:about_img]
      info.project_pics.attach(params[:info][:project_pics]) if params[:info][:project_pics]
      info.wood_pics.attach(params[:info][:wood_pics]) if params[:info][:wood_pics]
    end
    redirect_to root_path
  end

  private

  def info_params
    params.require(:info).permit(:header_image, :header_text, :main_image, :about_text, :contact_email)
  end
end
