class AddPasswordHash < ActiveRecord::Migration
  add_column :users, :password_hash, :string
end
