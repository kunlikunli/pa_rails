class Subject < ApplicationRecord
    self.primary_key = "id"
    has_many :course_subjects
    has_many :courses, through: :course_subjects
    
end
