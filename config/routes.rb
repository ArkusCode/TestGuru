Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  root to: 'tests#index'

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'
  delete :logout, to: 'sessions#destroy'

  resources :users, only: :create
  resources :sessions, only: :create

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    post :start, on: :member
  end

  resources :user_tests, only: %i[show update] do
    get :result, on: :member
  end
end
