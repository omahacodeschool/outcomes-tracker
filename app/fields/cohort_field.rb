require "administrate/field/base"

class CohortField < Administrate::Field::Base
  def to_s
    data
  end
end
