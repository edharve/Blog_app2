class AddAddressToArticles < ActiveRecord::Migration[5.0]
  def change
  	add_column :articles, :address, :string
  end
end
