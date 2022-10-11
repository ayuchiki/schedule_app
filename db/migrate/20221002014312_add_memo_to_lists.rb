class AddMemoToLists < ActiveRecord::Migration[6.1]
  def change
    add_column :lists, :memo, :string
  end
end
