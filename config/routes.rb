Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      namespace :merchants do
        controller :search do
          get '/find' => :show
          get '/find_all' => :index
        end
      end
      resources :merchants, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :customers, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
    end
  end

end
