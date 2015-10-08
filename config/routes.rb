Rails.application.routes.draw do
  # Omniauth
  get 'auth/facebook/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  resources :events do
    post :rsvp, to: 'rsvp#update'
  end

  root 'application#root'
end
