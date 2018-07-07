class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.string :image
      t.string :status
      t.integer :user_id
      t.integer :replies_count, default: 0
      t.integer :viewed_count, default: 0

      t.timestamps
    end
  end
end
