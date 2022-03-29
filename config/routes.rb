Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/blade_smiths', to: 'blade_smiths#index'
  get '/blade_smiths/new', to: 'blade_smiths#new'
  get '/blade_smiths/:id', to: 'blade_smiths#show'
  get '/blade_smiths/:id/edit', to: 'blade_smiths#edit'
  get '/blades', to: 'blades#index'
  get '/blade_smiths/:blade_smith_id/blades/new', to: 'blade_smith_blades#new'
  get '/blades/:id', to: 'blades#show'
  get '/blade_smiths/:blade_smith_id/blades', to: 'blade_smith_blades#index'
  post '/blade_smiths', to: 'blade_smiths#create'
  patch '/blade_smiths/:id', to: 'blade_smiths#update'
  post '/blade_smiths/:blade_smith_id/blades', to: 'blade_smith_blades#create'
  get 'blades/:id/edit', to: 'blades#edit'
  patch '/blades/:id', to: 'blades#update'
  delete '/blade_smiths/:id', to: 'blade_smiths#destroy'

end
