class Budget < ApplicationRecord
	validates :name, presence: true
	validates :money, presence: true
  belongs_to :garin
	has_many :transactions, dependent: :destroy
end
