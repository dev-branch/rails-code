Rails.application.routes.draw do
  get 'calc', to: 'calc#show'
  post 'calc', to: 'calc#compute'
  delete 'calc', to: 'calc#delete'
end
