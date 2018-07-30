Rails.application.routes.draw do

  root to: 'tests#index'

  devise_for :users

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :user_tests, only: %i[show update] do
    get :result, on: :member
  end

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
