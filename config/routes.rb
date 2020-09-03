Rails.application.routes.draw do
  root 'ideas#index'
  resources 'ideas', except: [:index]
end
