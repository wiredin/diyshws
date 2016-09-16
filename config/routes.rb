Rails.application.routes.draw do
  resources :cities do 
    resources :shows
  end
  
  root 'static_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
