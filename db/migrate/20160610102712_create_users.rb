# frozen_string_literal: true
# create users table
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :first_name
      t.string   :last_name
      t.string   :email
      t.string   :password_hash
      t.string   :password_salt
      t.date     :birthday
      t.boolean  :active
      t.timestamps
    end
  end
end
