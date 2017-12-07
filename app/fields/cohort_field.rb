require "administrate/field/base"

class CohortField < Administrate::Field::Base
  def to_s
    Cohort.find(data).name
  end
end
