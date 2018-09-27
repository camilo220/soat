class PurchaseInsuranceMailer < ApplicationMailer

  def summary(insurance)
    @insurance = insurance
    mail(to: insurance.vehicle.user.email,
      subject: "successful SOAT purchase")
  end 
end