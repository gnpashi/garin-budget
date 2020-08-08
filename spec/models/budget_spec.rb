require 'rails_helper'

RSpec.describe Budget, type: :model do
	context "validation tests" do
		it { should validate_presence_of(:name) }

		it "require presence of budget money" do
			budget = Budget.new(name: "budget").save
			expect(budget).to be false
		end
		it "budget money is integer" do
		 	budget = Budget.new(money: "sdsa").save
	 		expect(budget).to be false
		end

		it { should belong_to(:garin) }
		it { should have_many(:transactions) }

	end
end
