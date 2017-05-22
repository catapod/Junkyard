Rails.application.routes.draw do
  namespace :api do
    resources :materials do
      resources :chunks do
        resources :comments
        resources :translations
      end
    end
  end
end
