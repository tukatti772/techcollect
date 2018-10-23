class AddTypeToTags < ActiveRecord::Migration[5.0]
  def change
    add_column :tags, :type, :integer
  end
end
