class AddAvatarToImages < ActiveRecord::Migration
  def change
    add_column :images, :avatar, :string
    add_column :images, :name, :string
  end
end
