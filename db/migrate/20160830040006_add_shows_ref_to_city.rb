class AddShowsRefToCity < ActiveRecord::Migration[5.0]
  def change
    add_reference :cities, :show, foreign_key: true
  end
end
