class Insurance < ApplicationRecord

  belongs_to :vehicle

  before_save :calculate_validity
  before_validation :set_rate_id

  def set_rate_id
    self.rate_id = vehicle.rate.id
  end

  def calculate_validity
    self.start_date = vehicle.next_insurance_start_date
    self.end_date = start_date + 1.year
  end
end
