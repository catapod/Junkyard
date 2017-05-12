Rails.application.routes.draw do
  namespace :api do
    resources :materials
  end
end
