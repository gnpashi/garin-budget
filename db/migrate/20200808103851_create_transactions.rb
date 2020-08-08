class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :person
      t.integer :money
      t.belongs_to :budget, null: false, foreign_key: true

      t.timestamps
    end
  end
end
