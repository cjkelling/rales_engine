# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :customers do
        controller :find do
          get '/find', to: 'find#show'
          get '/find_all', to: 'find#index'
        end

        controller :random do
          get '/random', to: 'random#show'
        end
      end

      namespace :invoice_items do
        controller :find do
          get '/find', to: 'find#show'
          get '/find_all', to: 'find#index'
        end

        controller :random do
          get '/random', to: 'random#show'
        end
      end

      namespace :invoices do
        controller :find do
          get '/find', to: 'find#show'
          get '/find_all', to: 'find#index'
        end

        controller :random do
          get '/random', to: 'random#show'
        end
      end

      namespace :items do
        controller :find do
          get '/find', to: 'find#show'
          get '/find_all', to: 'find#index'
        end

        controller :random do
          get '/random', to: 'random#show'
        end

        controller :merchant do
          get '/:id/merchant', to: 'merchant#index'
        end
      end

      namespace :merchants do
        controller :find do
          get '/find', to: 'find#show'
          get '/find_all', to: 'find#index'
        end

        controller :random do
          get '/random', to: 'random#show'
        end

        controller :items do
          get '/:id/items', to: 'items#index'
        end

        controller :invoices do
          get '/:id/invoices', to: 'invoices#index'
        end
      end

      namespace :transactions do
        controller :find do
          get '/find', to: 'find#show'
          get '/find_all', to: 'find#index'
        end

        controller :random do
          get '/random', to: 'random#show'
        end

        controller :invoice do
          get '/:id/invoice', to: 'invoice#index'
        end
      end

      resources :customers, only: %i[index show]
      resources :invoice_items, only: %i[index show]
      resources :invoices, only: %i[index show]
      resources :items, only: %i[index show]
      resources :merchants, only: %i[index show]
      resources :transactions, only: %i[index show]
    end
  end
end
