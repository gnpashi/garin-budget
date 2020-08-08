class AddTransactionsToGarins < ActiveRecord::Migration[6.0]
  def change
		add_reference :transactions, :garin, index: true
  end
end
