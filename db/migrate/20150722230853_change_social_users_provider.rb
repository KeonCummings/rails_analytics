class ChangeSocialUsersProvider < ActiveRecord::Migration
	rename_column :social_users, :provide, :provider
end
