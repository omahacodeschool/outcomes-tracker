class Salary < ActiveRecord::Base
  belongs_to :position
  belongs_to :offer

  enum rate: {"yearly" => 0, "monthly" => 1, "bi-weekly" => 2, "weekly" => 3,
              "daily" => 4, "hourly" => 5}

  def amount=(input)
    super(input.gsub(/[^\d]/, '').to_i)
  end

end
