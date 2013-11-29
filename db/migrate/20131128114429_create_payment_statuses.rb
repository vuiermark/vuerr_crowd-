class CreatePaymentStatuses < ActiveRecord::Migration
  def change
    create_table :payment_statuses do |t|
      t.integer :user_id
      t.string :email
      t.float :amount
      t.integer :project_id

      t.timestamps
    end
  end
end
