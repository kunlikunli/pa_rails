class HomeController < ApplicationController
    def home
        @courses=Course.all
        @instructors=Instructor.all
        @subjects=Subject.all
        # @subject=Subject.all
        render 'home/home.html' 
    end
end
