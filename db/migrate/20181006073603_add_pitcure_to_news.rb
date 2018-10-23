class AddPitcureToNews < ActiveRecord::Migration[5.0]
  def change
    add_column :news, :picture, :text
  end
end
