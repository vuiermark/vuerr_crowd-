class Pledge < ActiveRecord::Base
  belongs_to :project

  validates :name, :email, presence: true
  validates :email, format: { with: /(\S+)@(\S+)/ }

  AMOUNT_LEVELS = [25.00, 50.00, 100.00, 200.00, 500.00]
  validates :amount, inclusion: { in: AMOUNT_LEVELS }, allow_blank: true

  MONTHLY_AMOUNT_LEVELS = [1.99, 2.99, 4.99, 9.99, 19.99]
  validates :monthly_amount, inclusion: { in: MONTHLY_AMOUNT_LEVELS }, allow_blank: true

end
