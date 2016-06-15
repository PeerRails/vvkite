class RemoveIndexOnEmail < ActiveRecord::Migration[5.0]
  def change
    remove_index :users, :email
    change_column :users, :email, :string, :null => false, default: "nothing@localhost"
  end
end
