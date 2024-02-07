#sets global year
if Rails.env == "development"
  Courses::Application.config.catalog_year = 25
else
  Courses::Application.config.catalog_year = 25 #this indicates the year the courses will run. I.E. if it is January 2024, we are in the 24-25 school year for the catalog which is id 25
end
