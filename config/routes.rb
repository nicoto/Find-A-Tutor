Rails.application.routes.draw do
  root to: 'static_pages#root'

  get '/tutor', to: 'static_pages#new_tutor'
  get '/student', to: 'static_pages#new_student'

  get '/login', to: 'sessions#new'
  # a create and destroy route on your sessions
  resources :sessions, only: [:create, :destroy]

  get 'events/search', to: 'events#search'
  resources :events, except: [:destroy]
  resources :users

end
