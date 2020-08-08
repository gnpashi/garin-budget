class AddDescriptionToTransaction < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :description, :string
  end
end
