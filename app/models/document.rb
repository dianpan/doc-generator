class Document < ActiveRecord::Base
  before_save :pdf_create
  belongs_to :user

  validates_presence_of :loan_amount, :down_payment, :interest_rate

  validates_numericality_of :loan_amount, :greater_than => 0, on: :create, message: "Loan amount must be greater than $0."
  validates_numericality_of :down_payment, :greater_than_or_equal_to => 0, on: :create, message: "Down payment cannot be negative."
  validates_numericality_of :interest_rate, :greater_than_or_equal_to => 0, inclusion: { in: 0..1000 }, on: :create, message: "Interest rates cannot be negative."

  validate :downpay_cannot_be_greater_than_loan

  has_attached_file :file
  validates_attachment :file, :content_type => { :content_type => 'application/pdf' }

  def downpay_cannot_be_greater_than_loan
    if (down_payment != nil && loan_amount != nil)
      if down_payment > loan_amount
        errors.add(:down_payment, "cannot be greater than your loan amount")
      end
    end
  end

  def pdf_create
    DocPdf.new(self)
  end

end
