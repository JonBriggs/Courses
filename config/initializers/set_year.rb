#sets global year
if Rails.env == "development"
  Courses::Application.config.catalog_year = 24
else
  Courses::Application.config.catalog_year = 24
end
