Rails.application.routes.draw do
  namespace :api do
    resources :materials do
      resources :chunks
    end
  end
end
