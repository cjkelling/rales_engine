# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customers, only: %i[index show]
      resources :merchants, only: %i[index show]
    end
  end
end
