Rails.application.routes.draw do

  root 'web/sessions#new'

  devise_for :users
  namespace :api, default: {format: :json} do
    namespace :v1 do 
      resources :users do 
        get :me, on: :collection
        resources :workdays, only: [:index] do
          put :checkin, on: :collection
          put :checkout, on: :collection
        end
        resources :reports, only: [:index] do 
          get :weekly, on: :collection, to: 'reports#employees'
        end
      end

      resources :reports, only: [:index] do
        get :weekly, on: :collection, to: 'reports#admin'
      end

      resources :sessions, only: [:create] do
        delete :destroy, on: :collection
      end
    end
  end

  namespace :web do
    resources :sessions, only: [:new, :create]
    resources :users
  end


end
