# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'

subject = JSON.parse(File.read('db/subject.json'))

subject.each do |s|
    
    id = s['id']
    
    Subject.new(name: s['name'], id:id).save(validate: false)
end

courses = JSON.parse(File.read('db/course.json'))

courses.each do |course|
    Course.new(name: course['name'], id: course['code'], description: course['description']).save(validate: false)
    
    course['subjects'].each do |i|
       
        CourseSubject.new(course_id: course['code'], subject_id: i['id']).save(validate: false)
    end

end

instructor = JSON.parse(File.read('db/instructor.json'))

instructor.each do |i|
    Instructor.create(last: i['last'], first: i['first'], email: i['email'], instructor_id: i['id'])
end

