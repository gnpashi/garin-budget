class Budget < ApplicationRecord
	validates :name, presence: true
	validates :money, presence: true
	enum kind: [ :adding, :resetting ]
	enum is_totaled: [ :un_totaled, :totaled ]
	validates :is_totaled, inclusion: { in: is_totaleds.keys }
  belongs_to :garin
  belongs_to :time_period
	has_many :transactions, dependent: :destroy
end
