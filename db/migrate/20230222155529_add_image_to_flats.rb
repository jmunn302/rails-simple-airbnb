class AddImageToFlats < ActiveRecord::Migration[7.0]
  def change
    add_column :flats, :image, :url
  end
end
