class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :race
      t.string :string
      t.date :birth
      t.string :weight
      t.text :habits
      t.belongs_to :user, index: true
      t.string :kind

      t.timestamps
    end
  end
end
