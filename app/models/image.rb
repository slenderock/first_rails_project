# frozen_string_literal: true
# model images
class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true

  attr_accessible :imageable_id, :imageable_type, :image

  mount_uploader :image, ImageUploader
end
