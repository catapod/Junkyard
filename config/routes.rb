# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    resources :materials do
      resources :chunks do
        resources :comments
        resources :translations do
          put 'rate', to: 'rates#rate'
        end
      end
    end
  end
end
