class AddOrderToPerformances < ActiveRecord::Migration[5.1]
  def change
    add_column :performances, :position, :integer
  end
end
