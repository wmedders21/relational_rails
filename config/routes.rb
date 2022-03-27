Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/blade_smiths', to: 'blade_smiths#index'
  get '/blade_smiths/new', to: 'blade_smiths#new'
  get '/blade_smiths/:id', to: 'blade_smiths#show'
  get '/blades', to: 'blades#index'
  get '/blades/:id', to: 'blades#show'
  get '/blade_smiths/:blade_smith_id/blades', to: 'blade_smith_blades#index'
end
