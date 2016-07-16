class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
    t.string :title
    end
  end
end

#command rails generate migration create_articles ... predefined method for creating a db table. since the
#    table needs to columns (title, description), we must create 2 migration files. 
#    this command creats a migration file (this file) under db/migrate
#    Active Record tracks which migrations have already been run so all you have to do is update your source and run rake db:migrate. Active Record will work out which migrations should be run. It will also update your db/schema.rb file to match the structure of your database.#
