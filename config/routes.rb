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
    end
  end



end
