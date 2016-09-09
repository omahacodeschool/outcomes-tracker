class Salary < ActiveRecord::Base
  belongs_to :position
  belongs_to :offer

  enum rate: {"yearly" => 0, "monthly" => 1, "bi-weekly" => 2, "weekly" => 3,
              "daily" => 4, "hourly" => 5}

  before_create :format 

  # Public: Formats salary for an Entry's show view
  def pretty_amount
    (amount > 1000) ? "$#{amount}" : "#{amount}/hr"
    # not perfect yet but for now
  end

  private
    def format
      binding.pry
      (remove_commas_from_amount > 1000) ? (amount = remove_commas_from_amount) : (amount = amount.to_i)
    end

    def remove_commas_from_amount
      amount.gsub(/[^\d]/, '').to_i 
    end
end
