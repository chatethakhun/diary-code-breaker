Rails.application.routes.draw do

  resources :expenses
  devise_for :users, controllers: {
    sessions: 'sessions/sessions',
    registrations: 'sessions/registrations'
  }

  resources :coupons do
    collection do
      get :cooking_run, to: 'pages#cooking_run'
      post :cooking_run, to: 'coupons#claim_coupon'
    end
  end

  resources :content_types do
    resources :contents
  end

  resources :avgle_movies do
    collection do
      post 'watch_lated/:vid', to: 'avgle_movies#watch_lated', as: :av_watch_lated
    end
  end

  get :avgle, to: 'pages#avgle'
  get '/avgle/:vid', to: 'pages#avgle_show', as: :av_detail
  get '/avgle_search', to: 'pages#av_search', as: :av_search

  get :manage_users, to: 'pages#manage_users'
  put :update_role_user, to: 'pages#update_role_user'

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
