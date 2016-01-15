class Document < ActiveRecord::Base
  validates_presence_of :loan_amount
  validates_presence_of :down_payment
  validates_presence_of :interest_rate
  validates_numericality_of :loan_amount, :greater_than => 0

  belongs_to :user

  has_attached_file :file
  validates_attachment :file, :content_type => { :content_type => 'application/pdf' }

end


http://s3.amazonaws.com/roostifyfile/documents/files/000/000/007/original/loan_document_2.pdf?1452828710
https://s3-us-west-1.amazonaws.com/roostifyfile/documents/files/000/000/006/original/loan_document_2.pdf
