class JobApplication < ActiveRecord::Base 
  belongs_to :entry 
  accepts_nested_attributes_for :entry

  # not sure if syntax is right.
  delegate :user_id, to: :entry

  enum nature_of_employment: {"internship" => 0, "apprenticeship" => 1, 
                              "freelance/contract" => 2, "part-time" => 3, 
                              "full-time" => 4, "self-employed" => 5}

end
