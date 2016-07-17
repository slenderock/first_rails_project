# frozen_string_literal: true
# Avatar uploader carriarwave
class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    # '/uploads/image/default/' + [version_name,
    # 'default.png'].compact.join('_')
    ActionController::Base.helpers.asset_path(
      'fallback/' + [version_name, 'default.png'].compact.join('_')
    )
  end

  version :thumb do
    process resize_to_limit: [200, 200]
  end
end
