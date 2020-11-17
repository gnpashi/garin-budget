class AddIsTotaledToBudget < ActiveRecord::Migration[6.0]
  def change
    add_column :budgets, :is_totaled, :integer
  end
end
