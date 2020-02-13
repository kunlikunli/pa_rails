json.extract! course, :id, :name, :code, :description, :subject, :created_at, :updated_at
json.url course_url(course, format: :json)
