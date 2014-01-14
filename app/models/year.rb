class Year < ActiveRecord::Base
  has_many :course_offerings

  def self.current
    self.where("current = 1").first
  end
  
  def self.next_year
    this_year_name = Year.current.name.split("-")
	next_year_name = this_year_name[1].to_s + "-" + (this_year_name[1].to_i + 1).to_s
	@next_year ||= Year.where("name = ?", next_year_name).first
  end
end
