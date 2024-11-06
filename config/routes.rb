Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  root "pages#index"

  resource :session, only: %i[ new create destroy ]
  resource :profile, only: %i[ edit update ] do
    get :password, action: :edit_password, as: :edit_password
    post :password, action: :update_password
  end
end
