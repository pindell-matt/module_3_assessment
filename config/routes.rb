Rails.application.routes.draw do
  root 'items#index'

  get '/search', to: 'searches#index'

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]


  namespace :api do
    namespace :v1, defaults: { format: 'json' } do
      get    '/items',     to: 'items#index',   as: 'items'
      get    '/items/:id', to: 'items#show',    as: 'item'
      delete '/items/:id', to: 'items#destroy'
      post   '/items',     to: 'items#create'
    end
  end

  get '/stores/:store_id', to: 'stores#show', as: 'store'
end
