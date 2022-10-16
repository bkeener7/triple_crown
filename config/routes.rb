Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/triples', to: 'triples#index'
  get '/triples/:id', to: 'triples#show'
  get '/winners_table_name', to: 'winners#index'
  get '/winners_table_name/:id', to: 'winners#show'
  get '/triples/:id/winners_table_name', to: 'triple_winners#index'
end
