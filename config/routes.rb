Rails.application.routes.draw do
  # root means the original url , with no / . the original url will call the hello function 
  #in application controller
  root "pages#home"
  get '/about',to:"pages#about"
  #For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :todos
end
