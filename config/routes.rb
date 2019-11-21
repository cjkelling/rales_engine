# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        controller :find do
          get '/find', to: 'find#show'
          get '/find_all', to: 'find#index'
        end
      end

      namespace :items do
        controller :find do
          get '/find', to: 'find#show'
          get '/find_all', to: 'find#index'
        end
      end

      resources :customers, only: %i[index show]
      resources :invoice_items, only: %i[index show]
      resources :invoices, only: %i[index show]
      resources :items, only: %i[index show]
      resources :transactions, only: %i[index show]
      resources :merchants, only: %i[index show]
    end
  end
end
