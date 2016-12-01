class AddArchitectsToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :architect, :string
  end
end
