class CreateShows < ActiveRecord::Migration[5.0]
  def change
    create_table :shows do |t|
      t.datetime :start_date
      t.string :venue
      t.string :facebook_event

      t.timestamps
    end
  end
end
