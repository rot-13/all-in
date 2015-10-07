Rails.application.routes.draw do

  # Omniauth
  get 'auth/facebook/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

end
