class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :facebook_id, null: false
      t.string :photo_url

      t.timestamps null: false
    end
  end
end
