class AddNullFalseToBudget < ActiveRecord::Migration[6.0]
  def change
    change_column_null :budgets, :time_period_id, false
  end
end
