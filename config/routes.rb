Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      namespace :transactions do
        get "/find", to: "search#show"
        get "/find_all", to: "search#index"
      end
      resources :transactions,  only: [:index, :show]

      namespace :merchants do
        get "/find", to: "search#show"
        get "/find_all", to: "search#index"
      end
      resources :merchants,     only: [:index, :show]

      namespace :items do
        get "/find", to: "search#show"
        get "/find_all", to: "search#index"
      end
      resources :items,         only: [:index, :show]

      namespace :invoices do
        get "/find_all", to: "search#index"
      end
      resources :invoices,      only: [:index]

      namespace :invoice_items do
        get "/find_all", to: "search#index"
      end
      resources :invoice_items, only: [:index]

      namespace :customers do
        get "/find_all", to: "search#index"
      end
      resources :customers,     only: [:index, :show]
    end
  end
end
