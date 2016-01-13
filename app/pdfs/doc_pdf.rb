class DocPdf < Prawn::Document
  def initialize(document, view)
    super()
    text "This is your loan document"
    @document = document
    @view = view
    text "Document #{@document.id}"
  end

  def loan_amount
  end

  def down_payment
  end

  def interest_rate
  end
end