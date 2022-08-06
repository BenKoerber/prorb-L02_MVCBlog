Rails.application.routes.draw do
  #root "registrations#new"
  resource :registrations, only: [:new, :create]
  resource :logins, only: [:new, :create]
  get "dashboards/index", as: :dashboards
end
