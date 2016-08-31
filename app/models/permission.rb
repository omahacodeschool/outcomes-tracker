class Permission < ActiveRecord::Base
  belongs_to :user

  # these abilities may change; for now, matching what abilities are in my local db / our seeds file
  enum ability: {"can export spreadsheet" => 0, 
                "can view all user entries" => 1, 
                "can edit all user entries" => 2
                }
end