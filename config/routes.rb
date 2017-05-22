Rails.application.routes.draw do
  namespace :api do
    resources :materials do
      resources :chunks do
        resources :comments
      end
    end
  end
end
