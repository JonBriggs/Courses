json.array!(@course_offerings) do |course_offering|
  json.extract! course_offering, 
  json.url course_offering_url(course_offering, format: :json)
end
