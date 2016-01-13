class DocPdf < Prawn::Document
  def initialize(document, view)
    super()
    text "This is your loan document"
  end
end