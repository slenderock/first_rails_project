class AddAvatarToImages < ActiveRecord::Migration
  def change
    add_column :images, :image, :string, null: false
  end
end
