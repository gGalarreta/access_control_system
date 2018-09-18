Rails.application.routes.draw do

  devise_for :users
  namespace :api, default: {format: :json} do
    namespace :v1 do 
      resources :users do 
        get :me, on: :collection
        resources :workdays, only: [:index] do
          put :checkin, on: :collection
          put :checkout, on: :collection
        end
      end

      resources :sessions, only: [:create] do
        delete :destroy, on: :collection
      end
    end
  end
end
