class Garin < ApplicationRecord
	validates :name, presence: true
	validates :money, presence: true
	has_many :budgets
	has_many :users
	has_many :transactions
	serialize :new_budgets, Array

	def new_money
		new_money = 0
		budgets.each do |budget|
			new_money += budget.money
	  end
		update(money: new_money)
	end

end
