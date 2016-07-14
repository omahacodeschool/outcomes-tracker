class Salary < ActiveRecord::Base
  belongs_to :position
  belongs_to :offer
end
