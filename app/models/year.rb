class Year < ActiveRecord::Base
  has_many :course_offerings

  def self.current
    self.where("current = 1").first
  end
end
