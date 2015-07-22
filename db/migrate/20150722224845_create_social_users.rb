class CreateSocialUsers < ActiveRecord::Migration
  def change
    create_table :social_users do |t|
      t.string, :provide
      t.string, :uid
      t.string, :name
      t.string :oauth_token

      t.timestamps
    end
  end
end
