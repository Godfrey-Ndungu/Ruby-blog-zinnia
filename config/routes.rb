Rails.application.routes.draw do
  devise_for :users
  get '/', to: 'articles#index', as: 'root'
  get 'articles/:slug', to: 'articles#show', as: 'article'
  get 'dashboard', to: 'dashboard#index', as: 'dashboard'
  resources :authors, only: [:index, :new, :create, :edit, :update]
end
