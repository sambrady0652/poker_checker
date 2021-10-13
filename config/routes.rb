Rails.application.routes.draw do
  get 'hands/show'
  get 'hands/new'
  resources :hands

  root 'hands#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
