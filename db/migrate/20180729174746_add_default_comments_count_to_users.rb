class AddDefaultCommentsCountToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:users, :comments_count, 0)
  end
end
