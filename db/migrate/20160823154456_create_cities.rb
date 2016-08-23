class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :state
      t.string :site_name
      t.text :description

      t.timestamps
    end
  end
end
