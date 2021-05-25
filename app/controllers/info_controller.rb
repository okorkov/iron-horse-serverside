class InfoController < ApplicationController
  def update
    info = Info.all.first
    info.update(info_params)
    redirect_to root_path
  end

  private

  def info_params
    params.require(:info).permit(:header_image, :header_text, :main_image, :about_text, :contact_email)
  end
end