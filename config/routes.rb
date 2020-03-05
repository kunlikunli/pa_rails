Rails.application.routes.draw do
  resources :users
  resources :subjects
  resources :instructors
  resources :courses

  get '/search' , to: 'home#search'
  get '/result' , to: 'home#result'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/profile', to: 'users#enrollment'
  post '/enroll/:course_id', to: 'users#enroll'
  delete '/drop/:course_id',  to: 'users#drop'
  
  root 'users#enrollment'

  # root 'home#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
