class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	belongs_to :garin, optional: true
  accepts_nested_attributes_for :garin
  has_many :transactions
end
