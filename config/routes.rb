Rails.application.routes.draw do
  root to: 'static_pages#root'

  get '/tutor', to: 'static_pages#new_tutor'
  get '/student', to: 'static_pages#new_student'

end
