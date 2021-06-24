class ApiController < ApplicationController

  skip_before_action :require_login

  def data
    info = Info.all.first
    user = User.all.first
    reviews = Info.get_request
    project_pics = []
    wood_pics = []

    info.project_pics.each do |img|
      project_pics << {
        url: img.service.send(:object_for, img.key).public_url,
        desc: find_description(img.blob_id)
      }
    end

    info.wood_pics.each do |img|
      wood_pics << {
        url: img.service.send(:object_for, img.key).public_url,
        desc: find_description(img.blob_id)
      }
    end

    render json: {
      header: {
        header_text:info.header_text,
      },
      about: {
        about_text:info.about_text,
        about_image:info.about_img.service.send(:object_for, info.about_img.key).public_url
      },
      project_pics: project_pics,
      wood_pics: wood_pics,
      contact: {
        email: info.contact_email
      },
      yelp: reviews
    }
  end
end