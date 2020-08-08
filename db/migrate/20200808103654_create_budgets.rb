class CreateBudgets < ActiveRecord::Migration[6.0]
  def change
    create_table :budgets do |t|
      t.string :name
      t.integer :money
      t.belongs_to :garin, null: false, foreign_key: true
      # t.has_many :transactions

      t.timestamps
    end
  end
end
