class Fragment < ActiveRecord::Base
  belongs_to :project
  mount_uploader :image, ImageUploader
end
