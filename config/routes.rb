Rails.application.routes.draw do
  
  resource :registration,     only: [:new, :create]
  resource :login,            only: [:new, :create, :destroy]
  
  resources :posts,           only: [:create, :show, :edit, :update, :destroy]

  get "dashboards/index",     as: :dashboard
  
  root "dashboards#index"
end
