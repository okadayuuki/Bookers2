class AddUseIdToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :use_id, :string
  end
end
