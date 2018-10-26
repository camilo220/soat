class Rate < ApplicationRecord
  before_save :set_total
  
  # Associations
  has_many :vehicles
  has_many :insurances
  
  belongs_to :coverage  

  # Validations
  validates :code, uniqueness: true
  validates :category, uniqueness: {scope: [:sub_category, :unit_of_measurement, :minimum_unit, :maximum_unit], message: ", sub category and units has to be unique"}
  
  # Constants
  FOSYGA_RATE = 0.5
  RUNT_RATE = 1610


  def runt
    RUNT_RATE
  end

  def fosyga
    bonus * FOSYGA_RATE
  end


  def calculate_total
    bonus + fosyga + RUNT_RATE
  end


  def set_total
    self.total = calculate_total
  end

end
