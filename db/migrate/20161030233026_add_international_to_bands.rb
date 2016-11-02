class AddInternationalToBands < ActiveRecord::Migration[5.0]
  def change
    add_column :bands, :international, :boolean
  end
end
