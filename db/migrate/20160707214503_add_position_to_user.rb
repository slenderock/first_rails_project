# frozen_string_literal: true
# add sortable position to users
class AddPositionToUser < ActiveRecord::Migration
  def change
    add_column :users, :position, :decimal
  end
end
