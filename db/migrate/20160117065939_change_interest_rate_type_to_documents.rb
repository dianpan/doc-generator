class ChangeInterestRateTypeToDocuments < ActiveRecord::Migration
  def change
    change_column :documents, :interest_rate, :decimal, precision: 16, scale: 2
    change_column :documents, :loan_amount, :decimal, precision: 16, scale: 2
    change_column :documents, :down_payment, :decimal, precision: 16, scale: 2
  end
end
