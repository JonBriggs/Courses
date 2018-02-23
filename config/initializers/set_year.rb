#sets global year
if Rails.env == "development"
  Courses::Application.config.catalog_year = 18
else
  Courses::Application.config.catalog_year = 19
end
