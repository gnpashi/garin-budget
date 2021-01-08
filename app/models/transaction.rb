class Transaction < ApplicationRecord
	validates :money, presence: true
	validates :date, presence: true
  belongs_to :budget
  belongs_to :garin
  belongs_to :user
end
