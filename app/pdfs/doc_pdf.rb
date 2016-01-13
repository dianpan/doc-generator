class DocPdf < Prawn::Document
  def initialize(document, view)
    super()
    text "This is your loan document"
    @document = document
    @view = view
    loan_amount
    down_payment
    interest_rate
  end

  def loan_amount
    text "Loan amount: $#{@document.loan_amount}"
  end

  def down_payment
    text "Down payment: $#{@document.down_payment}"
  end

  def interest_rate
    text "Interest rate: %#{@document.interest_rate}"
  end
end