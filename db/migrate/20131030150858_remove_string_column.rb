class RemoveStringColumn < ActiveRecord::Migration
  def change
    remove_column :pets, :string
  end
end
