Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "pages#index"

  get "/pre-built-checkout", to: 'pages#pre_built_checkout'
  get "/custom-checkout", to: 'pages#custom_checkout'
  get "/success", to: 'pages#success'
  get "/cancel", to: 'pages#cancel'
  post "/create-session", to: 'pages#create_session'
  post "/create-payment-intent", to: 'pages#create_payment_intent'
end
