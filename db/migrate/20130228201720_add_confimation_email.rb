class AddConfimationEmail < ActiveRecord::Migration
  def up
    add_column :users, :confirmation_code , :string
    add_column :users, :confirmed , :boolean
  end

  def down
    remove_column :users, :confirmation_code 
    remove_column :users, :confirmed 
  end
end
