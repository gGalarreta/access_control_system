Rails.application.routes.draw do

  root 'web/sessions#new'

  devise_for :users
  namespace :api do
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
    resources :sessions, only: [:new, :create] do
      delete :logout, on: :collection
    end
    resources :users
    resources :workdays, only: [:index] do
      get :checkin, on: :member
      put :register_checkin, on: :collection
      get :checkout, on: :collection
      put :register_checkout, on: :collection
    end
    resources :reports, only: [:index] do
      get :me, on: :collection
      get :employee, on: :member
    end
  end


end
