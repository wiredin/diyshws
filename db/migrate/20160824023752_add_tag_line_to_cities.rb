class AddTagLineToCities < ActiveRecord::Migration[5.0]
  def change
    add_column :cities, :tag_line, :text
  end
end
