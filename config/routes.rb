Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'sessions/sessions'
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

  get :avgle, to: 'pages#avgle'

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
