Rails.application.routes.draw do
  resources :history_items
  resources :projects
  devise_for :users

  root "projects#index"
end
