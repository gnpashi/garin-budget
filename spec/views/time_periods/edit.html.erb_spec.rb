require 'rails_helper'

RSpec.describe "time_periods/edit", type: :view do
  before(:each) do
    @time_period = assign(:time_period, TimePeriod.create!(
      length: 1,
      garin: nil,
      current_money: 1,
      money: 1
    ))
  end

  it "renders the edit time_period form" do
    render

    assert_select "form[action=?][method=?]", time_period_path(@time_period), "post" do

      assert_select "input[name=?]", "time_period[length]"

      assert_select "input[name=?]", "time_period[garin_id]"

      assert_select "input[name=?]", "time_period[current_money]"

      assert_select "input[name=?]", "time_period[money]"
    end
  end
end
