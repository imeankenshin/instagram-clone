Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :home, only: %i[index], path: ''
  resources :posts, only: %i[index show new create] do
    resource :likes, only: %i[create destroy]
    resource :comments, only: %i[create]
  end
  resources :users, only: %i[index show edit update] do
    resource :followers, only: %i[create destroy]
  end
end
