require 'rails_helper'

RSpec.describe Garin, type: :model do
	context "validation tests" do
		it { should validate_presence_of(:name) }

		it "require presence of garin money" do
		 	garin = Garin.new(name: "garin").save
	 		expect(garin).to be false
		end
		it "garin money is integer" do
		 	garin = Garin.new(money: "sdsa").save
	 		expect(garin).to be false
		end

		it { should have_many(:budgets) }
	end
end
