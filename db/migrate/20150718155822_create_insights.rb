class CreateInsights < ActiveRecord::Migration
  def change
    create_table :insights do |t|

      t.timestamps
    end
  end
end
