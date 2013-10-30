class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :description
      t.string :kind
      t.belongs_to :pet, index: true

      t.timestamps
    end
  end
end
