Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do

      namespace :transactions do
        get "/find",              to: "search#show"
        get "/:id/invoice",      to: "invoice#index"

      end
      resources :transactions,    only: [:index, :show]

      namespace :merchants do
        get "/find",              to: "search#show"
        get "/:id/items",         to: "items#index"
        get "/:id/invoices",      to: "invoices#index"
      end
      resources :merchants,       only: [:index, :show]

      namespace :items do
        get "/find",              to: "search#show"
        get "/:id/invoice_items", to: "invoice_items#index"
        get "/:id/merchant",      to: "merchant#index"
      end
      resources :items,           only: [:index, :show]

      namespace :invoices do
        get "/find",              to: "search#show"
      end
      resources :invoices,        only: [:index, :show]

      namespace :invoice_items do
        get "/find",              to: "search#show"
      end
      resources :invoice_items,   only: [:index, :show]

      namespace :customers do
        get "/find",              to: "search#show"
      end
      resources :customers,       only: [:index, :show]
    end
  end
end
