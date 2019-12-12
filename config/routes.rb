Rails.application.routes.draw do
  get 'contacts/new'
  get 'contacts/create'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :events
  resources :records
  root 'records#index'
  resources :foods do
    collection do
      get 'search'
    end
  end
  resources :tweets, only: [:index]
end
