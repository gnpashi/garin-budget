class Garin < ApplicationRecord
	validates :name, presence: true
	validates :money, presence: true
	has_many :budgets
	has_many :users
	has_many :transactions
	serialize :new_budgets, Array
end
