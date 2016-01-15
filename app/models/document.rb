class Document < ActiveRecord::Base
  validates_presence_of :loan_amount
  validates_presence_of :down_payment
  validates_presence_of :interest_rate

  validates_numericality_of :loan_amount, :greater_than => 0, on: :create
  validates_numericality_of :down_payment, :greater_than_or_equal_to => 0, on: :create
  validates_numericality_of :interest_rate, :greater_than_or_equal_to => 0, inclusion: { in: 0..100 }, on: :create

  belongs_to :user

  has_attached_file :file
  validates_attachment :file, :content_type => { :content_type => 'application/pdf' }

end
