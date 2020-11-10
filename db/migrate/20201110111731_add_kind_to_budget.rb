class AddKindToBudget < ActiveRecord::Migration[6.0]
  def change
    add_column :budgets, :kind, :integer, default: 0
    add_column :transactions, :date, :date
  end
end
