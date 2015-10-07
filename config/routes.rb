Rails.application.routes.draw do
<<<<<<< HEAD

  # Omniauth
  get 'auth/facebook/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

=======
  root 'application#root'
>>>>>>> master
end
