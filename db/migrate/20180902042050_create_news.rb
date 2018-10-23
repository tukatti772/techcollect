class CreateNews < ActiveRecord::Migration[5.0]
  def change
    create_table :news do |t|
      t.string :name
      t.text :text
      t.string :tag
      t.string :link
      t.integer :bookmark
      t.timestamps
    end
  end
end
