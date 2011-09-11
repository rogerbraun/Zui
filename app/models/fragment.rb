class Fragment < ActiveRecord::Base
  belongs_to :project
  has_many :comments
  mount_uploader :image, ImageUploader
end
