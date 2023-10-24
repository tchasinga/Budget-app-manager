Rails.application.routes.draw do
  devise_for :users, path: '/'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'splash#index'

  resources :groups do
    resources :exchanges
  end
end
