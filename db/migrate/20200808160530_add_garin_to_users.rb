class AddGarinToUsers < ActiveRecord::Migration[6.0]
  def change
	 add_reference :users, :garin, index: true
  end
end
