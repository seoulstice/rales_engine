Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      namespace :items do
        controller :search do
          get '/find' => :show
          get '/find_all' => :show
        end
      end
      resources :items, only: [:index, :show]

      namespace :invoices do
        controller :search do
          get '/find' => :show
          get '/find_all' => :show
        end
      end
      resources :invoices, only: [:index, :show]

      namespace :invoice_items do
        controller :search do
          get '/find' => :show
          get '/find_all' => :show
        end
      end
      resources :invoice_items, only: [:index, :show]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
