class AddCityRefToShows < ActiveRecord::Migration[5.0]
  def change
    add_reference :shows, :city, foreign_key: true
  end
end
