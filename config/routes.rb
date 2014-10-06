Rails.application.routes.draw do
  # You can have the root of your site routed with "root"
  root "welcome#index"

  get "/login" => "sessions#new"

  resource  :session, only: [:create, :destroy]

  resources :users do
    resources :items
  end

  resources :users do
    resources :outfits, only: [:index, :new, :create, :destroy, :show] do
      collection do
        match 'generate', :via => [:get, :post]
      end
    end
  end


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
    # get 'products/:id/purchase' => 'catalog#purchase', as: :purchase


  get 'users/:id/dashboard' => 'welcome#dashboard', as: :dashboard

  get 'users/:user_id/outfits/generate' => 'outfits#generate', as: :generate

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
