class InfoController < ApplicationController
  def update
    # raise params.inspect
    info = Info.all.first
    info.update(info_params)
    info.header_img.attach(params[:info][:header_image]) if params[:info][:header_image]
    redirect_to root_path
  end

  private

  def info_params
    params.require(:info).permit(:header_image, :header_text, :main_image, :about_text, :contact_email)
  end
end
