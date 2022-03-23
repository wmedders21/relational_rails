Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/blade_smiths', to: 'blade_smiths#index'
  get '/blade_smiths/:id', to: 'blade_smiths#show'
end
