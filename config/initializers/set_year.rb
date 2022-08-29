#sets global year
if Rails.env == "development"
  Courses::Application.config.catalog_year = 23
else
  Courses::Application.config.catalog_year = 23
end
