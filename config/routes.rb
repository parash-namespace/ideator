Rails.application.routes.draw do
  root 'ideas#index'
  resources 'ideas', except: [:index]

  get 'about' => 'static#about'
  get 'random' => 'static#random'
end
