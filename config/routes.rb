Rails.application.routes.draw do
  resources :events
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :records
  root 'records#index'
  resources :foods do
    collection do
      get 'search'
    end
  end
  resources :tweets, only: [:index]
end
