Rails.application.routes.draw do

  devise_for :users
  namespace :api, default: {format: :json} do
    namespace :v1 do 
      resources :users do 
        get :me, on: :collection
      end

      resources :sessions, only: [:create, :destroy]
    end
  end
end
