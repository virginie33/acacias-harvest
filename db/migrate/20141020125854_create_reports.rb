class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :forest_name
      t.string :user_name
      t.text :observation

      t.timestamps
    end
  end
end
