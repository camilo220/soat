class InsuranceSummaryPdfService 

  def call(insurance)
    InsuranceSummaryPdf.new(insurance)
  end
end 