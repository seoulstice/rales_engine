Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      namespace :merchants do
        controller :search do
          get '/find' => :show
          get '/find_all' => :index
        end
        controller :random do
          get '/random' => :show
        end
      end

      namespace :transactions do
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
