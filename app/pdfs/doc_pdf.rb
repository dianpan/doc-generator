class DocPdf < Prawn::Document
  def initialize(document, view)
    super()
    move_down 5
    text "Your loan document:", style: :bold, size: 25
    @document = document
    @view = view
    move_down 10
    loan_amount
    move_down 2
    down_payment
    move_down 2
    interest_rate
  end

  def loan_amount
    text "Loan amount: $#{@document.loan_amount}"
  end

  def down_payment
    text "Down payment: $#{@document.down_payment}"
  end

  def interest_rate
    text "Interest rate: #{@document.interest_rate}%"
  end
end