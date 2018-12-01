Rails.application.routes.draw do

  root 'transactions#index'

  get 'transactions/yearly_report'
  post '/api/process_transaction', to: 'transactions#create'

end
