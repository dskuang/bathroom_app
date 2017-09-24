Rails.application.routes.draw do
  root to: 'indicator#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/indicator/occupied', controller: 'indicator', action: 'occupied'
  post '/indicator/vacant', controller: 'indicator', action: 'vacant'

  mount ActionCable.server => '/cable'

end
