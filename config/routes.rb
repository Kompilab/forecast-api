Rails.application.routes.draw do
  scope :api do
    devise_for :users,
                path: 'auth',
                path_names: { registration: 'register' },
                defaults: { format: :json },
                controllers: {
                  registrations: 'registrations',
                  sessions: 'sessions'
                }
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json }, constraints: { :id => /[0-9]+(\%7C[0-9]+)*/ }, except: [:new, :edit] do
    namespace :v1 do
      resources :financial_transactions do
        member do
          get :calculations
        end

        collection do
          get :payment_methods
        end
      end
      resources :parent_categories
      resources :categories
    end
  end

  get '*path', to: "application#fallback_index_html", constraints: ->(request) do
    !request.xhr? && request.format.html?
  end
end
