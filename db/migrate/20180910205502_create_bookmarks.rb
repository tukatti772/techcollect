class CreateBookmarks < ActiveRecord::Migration[5.0]
  def change
    create_table :bookmarks do |t|
      t.integer :news_id
      t.integer :user_id

      t.timestamps
    end
  end
end
