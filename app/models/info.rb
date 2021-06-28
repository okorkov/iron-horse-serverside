require "uri"
require "net/http"
require 'dotenv'
require 'json'
Dotenv.load

class Info < ApplicationRecord

  has_one_attached :header_img
  has_one_attached :about_img
  has_many_attached :project_pics
  has_many_attached :wood_pics

  after_create :expire_cache
  after_update :expire_cache
  before_destroy :expire_cache

  def self.get_request
    api = ENV["YELP_KEY"]

    url = URI("https://api.yelp.com/v3/businesses/iron-horse-studio-fairfax/reviews")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["Authorization"] = "Bearer #{ENV["YELP_KEY"]}"

    response = https.request(request)
    JSON.parse(response.read_body)

  end

  def self.find_description(id)
    Description.find_by(image_id: id).content
  end

  def self.cache_api
    @info = Info.all.first
    @user = User.all.first
    @reviews = Info.get_request
    @project_pics = []
    @wood_pics = []

    @info.project_pics.each do |img|
      @project_pics << {
        url: img.service.send(:object_for, img.key).public_url,
        desc: self.find_description(img.blob_id)
      }
    end

    @info.wood_pics.each do |img|
      @wood_pics << {
        url: img.service.send(:object_for, img.key).public_url,
        desc: self.find_description(img.blob_id)
      }
    end

 
    Rails.cache.fetch("data", :expires_in => 60.minutes) do
      {
        header: {
          header_text:@info.header_text,
        },
        about: {
          about_text:@info.about_text,
          about_image:@info.about_img.service.send(:object_for, @info.about_img.key).public_url
        },
        project_pics: @project_pics,
        wood_pics: @wood_pics,
        contact: {
          email: @info.contact_email
        },
        yelp: @reviews
      }
    end  
  end

end
