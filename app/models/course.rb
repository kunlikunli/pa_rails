class Course < ApplicationRecord
    self.primary_key = "id"
    has_many :course_subjects
    has_many :subjects, through: :course_subjects
    has_many :enrollments
    has_many :users, through: :enrollments
    
end
