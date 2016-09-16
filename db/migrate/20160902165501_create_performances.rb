class CreatePerformances < ActiveRecord::Migration[5.0]
  def change
    create_table :performances do |t|
      t.references :band, foreign_key: true
      t.references :show, foreign_key: true

      t.timestamps
    end
  end
end
