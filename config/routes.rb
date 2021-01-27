Rails.application.routes.draw do

  resources :content_types do
    resources :contents
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
