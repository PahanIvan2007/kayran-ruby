Rails.application.routes.draw do
  get "home/index"
  devise_for :users, controllers: { registrations: "registrations" }

  authenticate :user do
    resources :events do
      member do
        get :qr
      end
    end
    resources :points do
      member do
        get :qr
      end
    end
    resources :boats
    resources :routes do
      resources :route_points, as: :points
    end
    resources :rentals, only: [:index, :show, :new, :create, :update]
    resources :teams
    resources :matches, only: [:index, :show, :update]
    resources :tournaments
    resources :franchises
    resources :gps_tracks, only: [:index, :show]
  end

  get "up" => "rails/health#show", as: :rails_health_check
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  get "dashboard" => "home#dashboard", as: :dashboard
  root "home#index"
end
