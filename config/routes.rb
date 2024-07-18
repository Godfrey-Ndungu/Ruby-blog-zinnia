Rails.application.routes.draw do
  devise_for :users
  get '/', to: 'articles#index', as: 'root'
  get 'articles/:slug', to: 'articles#show', as: 'article'
  get 'dashboard', to: 'dashboard#index', as: 'dashboard'
  resources :authors, only: [:index, :new, :create, :edit, :update]
  resources :categories, only: [:index, :new, :create, :edit, :update]
  resources :articles, param: :slug do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end
end
