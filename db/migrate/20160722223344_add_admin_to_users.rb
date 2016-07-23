class AddAdminToUsers < ActiveRecord::Migration
  
  def change
    add_column :users, :admin, :boolean, default: false # table | column to add | column values type |users are false by def
  end

end
