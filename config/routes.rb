Hackaton::Application.routes.draw do
  get 'select', to: 'posts#select'

  resources :posts

  resources :services, only: [:index, :show]

  resources :categories, only: [:index, :show]

  resources :pets do
    resources :posts, only: [ :new, :create ]
  end

  devise_for :users

  resource :dashboard

  root controller: :dashboards, action: :show
end
