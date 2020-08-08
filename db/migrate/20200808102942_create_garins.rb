class CreateGarins < ActiveRecord::Migration[6.0]
  def change
    create_table :garins do |t|
      t.string :name
      t.integer :money
      # t.has_many :budgets

      t.timestamps
    end
  end
end
