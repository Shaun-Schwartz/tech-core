Rails.application.routes.draw do

  resources :news, only: [:index]

  resources :organizations, only: [:new, :create, :show, :index, :destroy] do
    resources :events, only: [:new, :create, :show], shallow: true
  end

  resources :users, only: [:new, :create, :destroy] do
    resources :organizations, only: [:show, :create, :update], shallow: true
  end
  resource :session, only: [:new, :create, :destroy]
  resources :events, only:[:index, :new, :create, :destroy]
  namespace :admin, only: [:index] do
    resources :events, only: [:index, :create, :destroy]
    resources :organizations, only: [:index, :create, :destroy]
    resources :users, only: [:index, :create, :destroy]
  end

  resources :welcome, only: [:about]
  get('/', { to: 'organizations#index', as: :home })
  get('/about', { to: 'welcome#about', as: :about })
end
