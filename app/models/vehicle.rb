class Vehicle < ApplicationRecord


  before_validation :set_rate_id
  before_save :upcase_license

  # Associations
  belongs_to :user
  belongs_to :rate

  has_many :insurances
  
  
  # Validations
  validates :user_id, presence: true
  validates :rate_id, presence: true
  
  
  def age
    dob = self.year
    now = Date.current
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end

  def get_rate_id  
    selected_rate_id = 
      if year.present? 
        Rate.select(:id).where(category: self.category).where("? <= maximum_unit and ? >= minimum_unit", self.unit_value, self.unit_value).where("maximum_age >= ? and minimum_age <=  ?", self.age, self.age).last.id
      else 
        Rate.select(:id).where(category: self.category).where("? <= maximum_unit and ? >= minimum_unit", self.unit_value, self.unit_value).last.id
      end
  end

  def set_rate_id
    self.rate_id= get_rate_id
  end

  def upcase_license
    license.upcase!
  end

  def next_insurance_start_date 
    if insurances.empty? || (!insurances.empty? && !is_insurance?)
      DateTime.now
    else
      insurances.order('end_date DESC').first.end_date + 1.day
    end
  end 


  def is_insurance?
    insurances.present? && insurances.order('end_date DESC').first.end_date > DateTime.now
  end 
  

end
