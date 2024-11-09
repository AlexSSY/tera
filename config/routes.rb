Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  root "pages#index"
  get "/terms", to: "pages#terms", as: :terms
  get "/privacy", to: "pages#privacy", as: :privacy
  get "/search", to: "pages#search", as: :search

  resource :session, only: %i[ new create destroy ]
  resource :profile, only: %i[ show edit update ] do
    get :password, action: :edit_password, as: :edit_password
    post :password, action: :update_password
  end
  resources :coins, only: %i[ index ]
  resource :register, only: %i[ new create ]
  resources :nfts, only: %i[ index ]
  resource :wallet, only: %i[ show ]
end
