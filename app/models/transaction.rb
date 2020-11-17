class Transaction < ApplicationRecord
	validates :person, presence: true
	validates :description, presence: true
	validates :money, presence: true
	validates :date, presence: true
  belongs_to :budget
  belongs_to :garin
end
