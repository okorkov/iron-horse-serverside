class Info < ApplicationRecord

  has_one_attached :header_img
  has_one_attached :about_img
  has_many_attached :project_pics
  has_many_attached :wood_pics

end
