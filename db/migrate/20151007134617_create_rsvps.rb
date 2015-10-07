class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.belongs_to :event, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true
      t.integer :response, null: false
      t.integer :attendees, null: false, default: 1

      t.timestamps null: false
    end
  end
end
