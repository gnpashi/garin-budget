class ChangeMoneyToDecimal < ActiveRecord::Migration[6.0]
  def change
    change_column :garins, :money, :decimal
    change_column :budgets, :money, :decimal
    change_column :budgets, :current_money, :decimal
    change_column :time_periods, :money, :decimal
    change_column :time_periods, :current_money, :decimal
  end
end
