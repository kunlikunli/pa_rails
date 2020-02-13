Rails.application.routes.draw do
  resources :subjects
  resources :instructors
  resources :courses
  root 'home#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
