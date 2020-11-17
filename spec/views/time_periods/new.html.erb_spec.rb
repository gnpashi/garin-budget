require 'rails_helper'

RSpec.describe "time_periods/new", type: :view do
  before(:each) do
    assign(:time_period, TimePeriod.new(
      length: 1,
      garin: nil,
      current_money: 1,
      money: 1
    ))
  end

  it "renders new time_period form" do
    render

    assert_select "form[action=?][method=?]", time_periods_path, "post" do

      assert_select "input[name=?]", "time_period[length]"

      assert_select "input[name=?]", "time_period[garin_id]"

      assert_select "input[name=?]", "time_period[current_money]"

      assert_select "input[name=?]", "time_period[money]"
    end
  end
end
