class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.text :address
      t.text :description
      t.float :latitude
      t.float :longitude
      t.belongs_to :category, index: true

      t.timestamps
    end
  end
end
