class AddQuotationToNews < ActiveRecord::Migration[5.0]
  def change
    add_column :news, :quotation, :string
  end
end
