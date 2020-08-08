require 'rails_helper'

RSpec.describe Transaction, type: :model do
	context "validation tests" do
		it {should validate_presence_of(:person) }
		it { should validate_presence_of(:money) }
		it { should validate_presence_of(:description) }

		it "should validate money is integar" do
			transaction = Transaction.new(money: "sdsa").save
			expect(transaction).to be false
		end

		it { should belong_to(:budget) }

	end
end
