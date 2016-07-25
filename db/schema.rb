# encoding: UTF-8

ActiveRecord::Schema.define(version: 20_160_712_185_533) do
  create_table 'images', force: true do |t|
    t.string   'image'
    t.integer  'imageable_id'
    t.string   'imageable_type'
    t.datetime 'created_at',     null: false
    t.datetime 'updated_at',     null: false
  end

  create_table 'users', force: true do |t|
    t.string   'first_name'
    t.string   'last_name'
    t.string   'email'
    t.string   'password_hash'
    t.string   'password_salt'
    t.date     'birthday'
    t.boolean  'active'
    t.datetime 'created_at',    null: false
    t.datetime 'updated_at',    null: false
    t.decimal  'position'
    t.string   'role'
  end
end
