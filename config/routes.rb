Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")

  root "pages#home"
  resource :dashboard, only: [:show]
  resource :registration, only: %i[new create]
  resource :session, only: %i[new create destroy]
  resource :password_resets, only: %i[new create edit update]
end
