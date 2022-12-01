Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "application#index"
  # match "*", to: "application#index", format: false, via: :get
  # get '*get_assets', to: 'application#get_assets'
  get '/*path', to: 'application#index'
end
