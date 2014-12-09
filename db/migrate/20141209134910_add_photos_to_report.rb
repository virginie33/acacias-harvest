class AddPhotosToReport < ActiveRecord::Migration
  def change
    add_column :reports, :forest_photo, :string
  end
end
