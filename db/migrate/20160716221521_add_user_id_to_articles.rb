class AddUserIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :user_id, :integer #user_id foreign key to articles table (FK is of type int)#
  end
end
