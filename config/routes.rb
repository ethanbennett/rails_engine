Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do

      namespace :transactions do
        get "/find",                  to: "search#show"
        get "/find_all",              to: "search#index"
        get "/:id/invoice",           to: "invoice#index"
      end
      resources :transactions,        only: [:index, :show]

      namespace :merchants do
        get "/find",                  to: "search#show"
        get "/find_all",              to: "search#index"
        get "/:id/invoices",          to: "invoices#index"
        get "/:id/items",             to: "items#index"
      end
      resources :merchants,           only: [:index, :show]

      namespace :items do
        get "/find",                  to: "search#show"
        get "/find_all",              to: "search#index"
        get "/:id/best_day",          to: "best_day#index"
        get "/:id/invoice_items",     to: "invoice_items#index"
        get "/:id/merchant",          to: "merchant#index"
        get "/most_revenue",          to: "most_revenue#index"
        get "/most_items",            to: "most_items#index"
      end
      resources :items,               only: [:index, :show]

      namespace :invoices do
        get "/find",                  to: "search#show"
        get "/find_all",              to: "search#index"
        get "/:id/customer",          to: "customer#index"
        get "/:id/invoice_items",     to: "invoice_items#index"
        get "/:id/items",             to: "items#index"
        get "/:id/merchant",          to: "merchant#index"
        get "/:id/transactions",      to: "transactions#index"
      end
      resources :invoices,            only: [:index, :show]

      namespace :invoice_items do
        get "/find",                  to: "search#show"
        get "/find_all",              to: "search#index"
        get "/:id/invoice",           to: "invoice#index"
        get "/:id/item",              to: "item#index"
      end
      resources :invoice_items,       only: [:index, :show]

      namespace :customers do
        get "/find",                  to: "search#show"
        get "/find_all",              to: "search#index"
        get "/:id/invoices",          to: "invoices#index"
        get "/:id/favorite_merchant", to: "favorite_merchant#index"
        get "/:id/transactions",      to: "transactions#index"
      end
      resources :customers,           only: [:index, :show]
    end
  end
end
