class AddMonthlyAmountToPledges < ActiveRecord::Migration
  def change
    add_column :pledges, :monthly_amount, :decimal
  end
end
