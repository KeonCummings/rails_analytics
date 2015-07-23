class ChangeUserLogin < ActiveRecord::Migration
  rename_column :users, :uid, :email
  rename_column :users, :oauth_token, :password
  remove_column :users, :provider
end
