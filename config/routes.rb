Rails.application.routes.draw do

  namespace :backend do
    devise_for :admins, controllers: {
      registrations: 'backend/registrations',
      sessions: 'backend/sessions',
      passwords: 'backend/passwords',
      confirmations: 'backend/confirmations'
    }
    resources :items
    resources :maps, only: [:index] do
      collection do
        get :getAll
      end
    end
    resources :clients#, only: [:index, :show]
  end

  devise_for :users
  get 'home/index'
  root to: "home#index"

  namespace :api, default: { format: :json } do
    namespace :v1 do
      resources :sessions, only: [:create]
      resources :items, only: [:index]
      resources :maps do
        collection do
          get :getAll
        end
      end
    end
  end

end
