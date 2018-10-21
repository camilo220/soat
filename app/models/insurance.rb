class Insurance < ApplicationRecord

  belongs_to :vehicle

  before_save :calculate_validity

  def calculate_validity
    self.start_date = vehicle.next_insurance_start_date
    self.end_date = start_date + 1.year
  end
end
