class AddCommentToNews < ActiveRecord::Migration[5.0]
  def change
    add_column :news, :comment, :integer
  end
end
