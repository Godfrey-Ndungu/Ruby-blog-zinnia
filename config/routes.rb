Rails.application.routes.draw do
  namespace :dashboard do
    get 'profiles/index'
  end
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

  get '/', to: 'articles#index', as: 'root'
  get 'articles/:slug', to: 'articles#show', as: 'article'
  get 'dashboard/index', to: 'dashboard#index', as: 'dashboard'

  namespace :dashboard do
    resources :blogs, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :authors, only: [:index, :new, :create, :edit, :update]
    resources :categories, only: [:index, :new, :create, :edit, :update]
    resources :profiles, only: [:index]
  end

  resources :articles, param: :slug do
    resources :comments, only: [:create, :edit, :update, :destroy]
    post 'like', to: 'article_likes#create', as: 'like_article'
    delete 'unlike', to: 'article_likes#destroy', as: 'unlike_article'
  end

end
