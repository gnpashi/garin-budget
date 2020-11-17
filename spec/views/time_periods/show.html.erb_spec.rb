require 'rails_helper'

RSpec.describe "time_periods/show", type: :view do
  before(:each) do
    @time_period = assign(:time_period, TimePeriod.create!(
      length: 2,
      garin: nil,
      current_money: 3,
      money: 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
