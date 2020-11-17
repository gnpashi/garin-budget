class Budget < ApplicationRecord
	validates :name, presence: true
	validates :money, presence: true
	enum kind: [ :adding, :resetting ]
	enum is_totaled: [ :no, :yes ]
  belongs_to :garin
	has_many :transactions, dependent: :destroy
end
