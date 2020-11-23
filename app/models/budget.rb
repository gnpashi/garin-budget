class Budget < ApplicationRecord
	validates :name, presence: true
	validates :money, presence: true
	enum kind: [ :adding, :resetting ]
  belongs_to :garin
  belongs_to :time_period
	has_many :transactions, dependent: :destroy
end
