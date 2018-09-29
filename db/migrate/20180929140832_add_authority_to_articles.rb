class AddAuthorityToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :authority, :string, null: false, default: "all"
  end
end
