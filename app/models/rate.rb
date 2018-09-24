class Rate < ApplicationRecord
  before_save :set_total
  
  # Associations
  has_many :vehicles


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
