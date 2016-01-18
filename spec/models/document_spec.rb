require 'rails_helper'

describe Document do
  it 'is valid with a loan amount, down payment, interest rate, and file attachment' do
    document = Document.new(
      loan_amount: 10000,
      down_payment: 100,
      interest_rate: 10)
    expect(document).to be_valid
  end

  it 'is invalid with a loan amount of $0' do
    document = Document.new(loan_amount: 0)
    expect(document.valid?).to eq(false)
  end

  it 'is invalid with a negative loan amount' do
    document = Document.new(
      loan_amount: -1,
      down_payment: 0,
      interest_rate: 0)
    expect(document.valid?).to eq(false)
  end

  it 'is invalid with a negative down payment amount' do
    document = Document.new(
      loan_amount: 100,
      down_payment: -1,
      interest_rate: 10)
    expect(document.valid?).to eq(false)
  end

  it 'is invalid with a negative down interest rate' do
    document = Document.new(
      loan_amount: 100,
      down_payment: 10,
      interest_rate: -1)
    expect(document.valid?).to eq(false)
  end

  it 'is invalid when the down payment is greater than the loan amount' do
    document = Document.new(
      loan_amount: 10,
      down_payment: 100,
      interest_rate: 10)
    expect(document.valid?).to eq(false)
  end
end