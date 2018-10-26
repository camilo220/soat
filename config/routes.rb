Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      scope :rates do
        get '/' => 'rates#index', as: :rates
        get '/:id' => 'rates#show'
        post '/' => 'rates#create'
        patch '/:id' => 'rates#update'
        put '/:id' => 'rates#update'
        delete '/:id' => 'rates#destroy'
      end
      
      scope :vehicles do
        get '/' => 'vehicles#index', as: :vehicles
        get '/:id' => 'vehicles#show'
        post '/' => 'vehicles#create'
        patch '/:id' => 'vehicles#update'
        put '/:id' => 'vehicles#update'
        delete '/:id' => 'vehicles#destroy'
      end
      
      scope :users do
        get '/' => 'users#index', as: :users
        get '/:id' => 'users#show'
        post '/' => 'users#create'
        patch '/:id' => 'users#update'
        put '/:id' => 'users#update'
        delete '/:id' => 'users#destroy'
      end

      scope :insurances do
        get '/' => 'insurances#index', as: :insurances
        get '/:id' => 'insurances#show'
        post '/' => 'insurances#create'
        patch '/:id' => 'insurances#update'
        put '/:id' => 'insurances#update'
        delete '/:id' => 'insurances#destroy'
      end
    end
  end



end
