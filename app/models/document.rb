class Document < ActiveRecord::Base
  validates_presence_of :loan_amount
  validates_presence_of :down_payment
  validates_presence_of :interest_rate
  validates_numericality_of :loan_amount, :greater_than => 0

  belongs_to :user

  has_attached_file :file,
                    :storage => :s3,
                    :s3_credentials => {:bucket => ENV['AWS_BUCKET'],
                                        :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
                                        :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']},
                                        :s3_protocol    => "https",
                                        :s3_host_name   => "s3-us-west-1.amazonaws.com"

  validates_attachment :file, :content_type => { :content_type => 'application/pdf' }

end
