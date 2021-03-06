class TimePeriod < ApplicationRecord
  belongs_to :garin
  has_many :budgets, dependent: :destroy


  def heb_month
    months = {
      1 => "ינואר",
      2 => "פברואר",
      3 => "מרץ",
      4 => "אפריל",
      5 => "מאי",
      6 => "יוני",
      7 => "יולי",
      8 => "אוגוסט",
      9 => "ספטמבר",
      10 => "אוקטובר",
      11 => "נובמבר",
      12 => "דצמבר"
    }
    months[self.date.month]
  end

  def transactions
    Transaction.where(budget_id: self.budgets.ids)
  end
end
