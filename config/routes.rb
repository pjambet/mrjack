MrJack::Application.routes.draw do
  resources :games do
    resources :players
  end
  resources :characters
  resources :users
end
