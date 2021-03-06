Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #get 'articles/home' ,to: 'article#home'
  root 'articles#home'
  get 'about' ,to: 'articles#about'

  resources :articles

  get 'signup' , to:"users#new"
  resources :users,except: [:new]

  get 'login' , to: "sessions#new"
  post 'login' , to: "sessions#create"
  delete 'login' , to: "sessions#destroy"

end
