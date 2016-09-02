class CreateBands < ActiveRecord::Migration[5.0]
  def change
    create_table :bands do |t|
      t.string :name
      t.string :state
      t.string :country
      t.string :bandcamp

      t.timestamps
    end
  end
end
