require 'rails_helper'

RSpec.describe "time_periods/index", type: :view do
  before(:each) do
    assign(:time_periods, [
      TimePeriod.create!(
        length: 2,
        garin: nil,
        current_money: 3,
        money: 4
      ),
      TimePeriod.create!(
        length: 2,
        garin: nil,
        current_money: 3,
        money: 4
      )
    ])
  end

  it "renders a list of time_periods" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
  end
end
