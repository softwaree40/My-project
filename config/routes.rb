Rails.application.routes.draw do
resources :categories do 
    resources :jobs
  end
  resources :users, only: [:new,:create]
  get '/auth/:provider/callback', to: 'sessions#create'
  root 'sessions#welcome'
   get 'login', to: 'sessions#new'
   delete '/logout' => 'sessions#destroy'
   post "login", to: "sessions#create"
   
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
