class ChangeMoneyInTransaction < ActiveRecord::Migration[6.0]
  def change
    change_column :transactions, :money, :decimal
  end
end
