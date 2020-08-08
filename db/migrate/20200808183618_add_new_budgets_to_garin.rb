class AddNewBudgetsToGarin < ActiveRecord::Migration[6.0]
  def change
    add_column :garins, :new_budgets, :text
  end
end
