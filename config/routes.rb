Rails.application.routes.draw do
  get '/', to: 'projects#show'
  get '/projects', to: 'projects#index'
  post '/projects/:id/todos', to: 'projects#create'
  patch '/projects/:id/todos/:idx' , to:'todos#update'
end
