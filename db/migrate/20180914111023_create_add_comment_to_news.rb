class CreateAddCommentToNews < ActiveRecord::Migration[5.0]
  def change
    create_table :add_comment_to_news do |t|
      t.integer :comment

      t.timestamps
    end
  end
end
