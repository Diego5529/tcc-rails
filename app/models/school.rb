class School < ActiveRecord::Base
  def self.find_unarchived(id)
    p id, '///////////////'
    find_by(id: id)
  end

  def archive
    self.archived = true
    self.save
  end
end