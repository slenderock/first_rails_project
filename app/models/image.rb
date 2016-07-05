class Image < ActiveRecord::Base
  belongs_to :imageable, :polymorphic => true

  attr_accessible :imageable_id, :imageable_type ,:name, :image

  mount_uploader :image, ImageUploader
  validates_presence_of :image
  validates_integrity_of :image
end
