class RemoveOauthReferenceFromUsers < ActiveRecord::Migration
  remove_column :users, :oauth_expires_at
end
