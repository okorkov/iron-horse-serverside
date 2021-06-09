require "uri"
require "net/http"


class Info < ApplicationRecord

  has_one_attached :header_img
  has_one_attached :about_img
  has_many_attached :project_pics
  has_many_attached :wood_pics

  def self.get_request
    api = ENV["YELP_KEY"]

    url = URI("https://api.yelp.com/v3/businesses/iron-horse-studio-fairfax/reviews")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["Authorization"] = `Bearer #{ENV["YELP_KEY"]}`

    response = https.request(request)
    response.read_body

  end

end
