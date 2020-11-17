class CreateTimePeriods < ActiveRecord::Migration[6.0]
  def change
    create_table :time_periods do |t|
      t.date :date
      t.integer :length
      t.references :garin, null: false, foreign_key: true
      t.integer :current_money
      t.integer :money

      t.timestamps
    end
  end
end
