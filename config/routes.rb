Rails.application.routes.draw do
  devise_for :users,
              controllers: {
                sessions: 'users/sessions',
                registrations: 'users/registrations'
              }
            
  get '/member-data', to: 'members#show'
  
  # Defines the root path route ("/")
  # root "articles#index"
end
