Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/tasks', to: 'tasks#list', as: :tasks
  get '/tasks/new', to: 'tasks#new', as: :create
  get '/tasks/:id', to: 'tasks#show', as: :task
  get '/tasks/:id', to: 'tasks#destroy', as: :delete
  get '/tasks/:id/edit', to: 'tasks#edit', as: :edit
  patch '/tasks/:id', to: 'tasks#update'
  delete '/tasks/:id', to: 'tasks#destroy'
  post '/tasks', to: 'tasks#create'
  # no prefix (find out why)
   # no prefix (find out why)
  # Defines the root path route ("/")
  # root "articles#index"
end
