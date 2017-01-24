Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      namespace :transactions do
        get "/find", to: "search#show"
      end
      resources :transactions,  only: [:index, :show]

      namespace :merchants do
        get "/find", to: "search#show"
      end
      resources :merchants,     only: [:index, :show]

      namespace :items do
        get "/find", to: "search#show"
      end
      resources :items,         only: [:index, :show]

      resources :invoices,      only: [:index]
      resources :invoice_items, only: [:index]
      resources :customers,     only: [:index, :show]
    end
  end
end
