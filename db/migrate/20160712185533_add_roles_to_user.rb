# frozen_string_literal: true
# add column for CanCan foles
class AddRolesToUser < ActiveRecord::Migration
  def change
    add_column :users, :role, :string
  end
end
