class Permission < ActiveRecord::Base
  belongs_to :user

  enum ability: {"can export spreadsheet" => 0, 
                "can view all user entries" => 1, 
                "can edit all user entries" => 2
                }
end