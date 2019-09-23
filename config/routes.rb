Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #get 'articles/home' ,to: 'article#home'
  root 'articles#home'
  get 'about' ,to: 'articles#about'

  resource :articles

end
