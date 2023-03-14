Rails.application.routes.draw do
  resources :projects do
    resources :history_items
  end
  devise_for :users

  root "projects#index"
end
