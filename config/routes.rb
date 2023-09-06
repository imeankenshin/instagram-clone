Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :home, only: %i[index], path: ""
  resources :posts, only: %i[index show new create] do
    resource :likes, only: %i[create destroy]
  end
  resources :users, only: %i[index show edit update]
end
