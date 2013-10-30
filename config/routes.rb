Hackaton::Application.routes.draw do
  resources :categories

  resources :pets

  devise_for :users

  resource :dashboard

  root controller: :dashboards, action: :show
end
