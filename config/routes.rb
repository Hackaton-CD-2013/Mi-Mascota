Hackaton::Application.routes.draw do
  resources :categories

  resources :pets

  devise_for :users
end
