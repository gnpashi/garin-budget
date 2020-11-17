class AddStartMoneyToGarin < ActiveRecord::Migration[6.0]
  def change
    add_column :garins, :start_money, :integer
  end
end
