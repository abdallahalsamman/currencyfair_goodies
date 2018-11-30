Rails.application.routes.draw do

  root 'transactions#index'

  post '/api/process_transaction', to: 'transactions#create'

end
