Hackaton::Application.routes.draw do
  resources :pets

  devise_for :users
end
