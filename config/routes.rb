Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      namespace :merchants do

        controller :revenue do
          get '/:id/revenue' => :show
          get '/revenue' => :index
        end
        controller :items do
          get '/:id/items' => :show
        end
        controller :invoices do
          get '/:id/invoices' => :show
        end
        controller :customers_with_pending_invoices do
          get '/:id/customers_with_pending_invoices' => :show
        end
        controller :favorite_customer do
          get '/:id/favorite_customer' => :show
        end
        controller :search do
          get '/find' => :show
          get '/find_all' => :index
        end
        controller :random do
          get '/random' => :show
        end
        controller :most_revenue do
          get '/most_revenue' => :show
        end
        controller :most_items do
          get 'most_items' => :show
        end

      end

      namespace :transactions do
        controller :invoices do
          get '/:id/invoice' => :show
        end
        controller :search do
          get '/find' => :show
          get '/find_all' => :index
        end
        controller :random do
          get '/random' => :show
        end
      end

      namespace :customers do
        controller :search do
          get '/find' => :show
          get '/find_all' => :index
        end
        controller :random do
          get '/random' => :show
        end
        controller :favorite_merchant do
          get '/:id/favorite_merchant' => :show
        end
        controller :invoices do
          get '/:id/invoices' => :show
        end
        controller :transactions do
          get '/:id/transactions' => :show
        end
      end

      resources :merchants, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :customers, only: [:index, :show]

      namespace :items do
        controller :search do
          get '/find' => :show
          get '/find_all' => :index
        end
        controller :random do
          get '/random' => :show
        end
        controller :most_revenue do
          get '/most_revenue' => :show
        end
        controller :best_day do
          get '/:id/best_day' => :show
        end
        controller :most_items do
          get '/most_items' => :index
        end
      end
      resources :items, only: [:index, :show]

      namespace :invoices do
        controller :search do
          get '/find' => :show
          get '/find_all' => :index
        end
        controller :random do
          get '/random' => :show
        end
        controller :best_day do
          get '/:id/best_day' => :show
        end
        controller :transactions do
          get '/:id/transactions' => :show
        end
      end
      resources :invoices, only: [:index, :show]

      namespace :invoice_items do
        controller :search do
          get '/find' => :show
          get '/find_all' => :index
        end
        controller :random do
          get '/random' => :show
        end
      end
      resources :invoice_items, only: [:index, :show]

    end
  end

end
