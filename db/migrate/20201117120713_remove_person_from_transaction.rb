class RemovePersonFromTransaction < ActiveRecord::Migration[6.0]
  def change
    remove_column :transactions, :person
  end
end
