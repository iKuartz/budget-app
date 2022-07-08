Rails.application.routes.draw do
  resources :entities
  resources :categories
  devise_for :users
  root 'home#splash'
end
