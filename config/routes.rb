Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'dashboards#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end


  get '/transactions/new' => 'transactions#new'
  get '/transactions' => 'transactions#index'
  get '/transactions/transfer' => 'transactions#transfer'
  post '/transactions/transfer' => 'transactions#transfer'
  post '/transactions/load' => 'transactions#load'
  post '/transactions/timeout' => 'transactions#timeout'
  post '/transactions/create' => 'transactions#create'
end
