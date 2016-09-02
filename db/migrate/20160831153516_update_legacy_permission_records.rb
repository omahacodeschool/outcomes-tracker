class UpdateLegacyPermissionRecords < ActiveRecord::Migration
  def change
    Permission.all.each do |permission|
      a = Ability.find_by_id(permission.ability_id)
      if a.description == "can export spreadsheet"
        permission.ability = 0
      elsif a.description == "can view all user entries"
        permission.ability = 1
      elsif a.description == "can edit all user entries"
        permission.ability = 2
      else
        permission.ability = nil
      end
      permission.save
    end
  end
end
