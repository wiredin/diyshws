class RenameShowStartDateToStartDatetime < ActiveRecord::Migration[5.0]
  def change
    rename_column :shows, :start_date, :start_datetime 
  end
end
