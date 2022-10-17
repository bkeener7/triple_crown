Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/triples', to: 'triples#index'
  get '/triples/new', to: 'triples#new'
  get '/triples/:id/edit', to: 'triples#edit'
  get '/triples/:id', to: 'triples#show'
  get '/winners_table_name', to: 'winners#index'
  get '/winners_table_name/:id', to: 'winners#show'
  get '/triples/:id/winners_table_name', to: 'triple_winners#index'
  post '/triples', to: 'triples#create'
  patch '/triples/:id', to: 'triples#update' 
end
