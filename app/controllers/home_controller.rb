class HomeController < ApplicationController
    def home
        @courses=Course.all
        @instructors=Instructor.all
        @subjects=Subject.all
        render 'home/home.html' 
    end
    
    def search
        subjects=Subject.all
        @option = []
        @option.push(["select", nil])
        
        subjects.each do |i| 
            @option.push([i.name, i.id])
        end
        render 'home/search.html'
    end

    def result
        if params[:subject].blank?
            @courses = Course.where("name LIKE ?", "%#{params[:q]}%")

            
        else
            if params[:q].blank?
                # puts "ininiininininini"
                @courses = Subject.find(params[:subject]).courses
            
            else
                @courses = Subject.find(params[:subject]).courses.where("name LIKE ?", 
                                    "%#{params[:search_text]}%")
            end 
            
          
        end
        render 'home/index'
    end

end
