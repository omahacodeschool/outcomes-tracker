class Offer < ActiveRecord::Base
  belongs_to :entry
  has_one :salary
  accepts_nested_attributes_for :entry, :salary

  enum nature_of_employment: {"internship" => 0, "apprenticeship" => 1, 
                              "freelance/contract" => 2, "part-time" => 3, 
                              "full-time" => 4, "self-employed" => 5}
                              
end
