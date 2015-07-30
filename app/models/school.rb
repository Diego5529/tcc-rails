class School < ActiveRecord::Base
  def self.find_unarchived(id)
    find_by!(id: id, archived: [nil, false])
  end

  def archive
    self.archived = true
    self.save
  end
end