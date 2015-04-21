Rails.application.routes.draw do

  namespace :vin do

    resources :sub do
      member do
        get "search"
        get "delivery"
      end

      resources :shipments do
        resources :notes
      end

      resources :wines do
        member do
          get "rating"
          post "rating"
        end
        resources :notes
      end

      resources :deliveries
    end
    
    resources :admin do
      # resources :revenue
      resources :monthly_selection
    end

    resources :partner

    resources :receipt

    resources :wines

  end

end
