class AddCurrentMoneyToBudget < ActiveRecord::Migration[6.0]
  def change
    add_column :budgets, :current_money, :integer
  end
end
