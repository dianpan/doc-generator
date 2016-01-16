class Document < ActiveRecord::Base
  validates_presence_of :loan_amount, message: "Please fill in a loan amount."
  validates_presence_of :down_payment, message: "Please fill in a down payment amount."
  validates_presence_of :interest_rate, message: "Please fill in your interest rate."

  validates_numericality_of :loan_amount, :greater_than => 0, on: :create, message: "Loan amount must be greater than $0."
  validates_numericality_of :down_payment, :greater_than_or_equal_to => 0, on: :create, message: "Sorry, down payment cannot be negative!"
  validates_numericality_of :interest_rate, :greater_than_or_equal_to => 0, inclusion: { in: 0..100 }, on: :create, message: "Nice try, but interest rates can't be negative!"

  belongs_to :user

  has_attached_file :file
  validates_attachment :file, :content_type => { :content_type => 'application/pdf' }

end
