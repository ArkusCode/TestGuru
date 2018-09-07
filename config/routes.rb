Rails.application.routes.draw do

  root to: 'tests#index'

  devise_for :users, controllers: { sessions: "sessions" }

  resources :feedbacks, only: %i[create new]

  resources :badges, only: :index
  get 'show_all', to: 'badges#show_all'

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :user_tests, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end

    resources :gists, only: :index
    resources :badges
  end
end
