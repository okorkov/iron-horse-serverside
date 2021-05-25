class ContactController < ApplicationController

  def edit
    # render json: @info, include: [:header_img, :about_img], except: [:created_at, :updated_at, :header_image, :main_image]
    # render json: {header_img: url_for(@info.header_img)}
    
  end

end