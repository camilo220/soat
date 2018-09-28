class InsurancesController < ApplicationController
  def show 
    insurance = Insurance.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = InsuranceSummaryPdfService.new.call(insurance)
        send_data pdf.render, filename: "#{insurance.vehicle.license}.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
    # render json: insurance
  end 
end