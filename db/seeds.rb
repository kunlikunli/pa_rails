# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'

# courses = JSON.parse(File.read('db/course.json'))

# courses.each do |course|
#     Course.create(name: course['name'], code: course['code'], description: course['description'], subject:course['subject'])
# end

instructor = JSON.parse(File.read('db/instructor.json'))

# instructor.each do |i|
    # Instructor.create(last: i['last'], first: i['first'], email: i['email'], instructor_id: i['id'])
# end

subject = JSON.parse(File.read('db/subject.json'))

subject.each do |s|
    puts s['name']
    id = s['id'].to_s[5..8].to_i
    puts id
    Subject.create(name: s['name'], subject_id:id)
end