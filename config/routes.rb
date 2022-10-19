Rails.application.routes.draw do

  #Startup
  get '/', to: 'triples#index'

  #Triple Crown Series Routes
  get '/triples', to: 'triples#index'
  get '/triples/new', to: 'triples#new'
  get '/triples/:id/edit', to: 'triples#edit'
  get '/triples/:id', to: 'triples#show'
  post '/triples', to: 'triples#create'
  patch '/triples/:id', to: 'triples#update'
  delete '/triples/:id', to: 'triples#destroy'

  #Triple Crown Winner Routes
  get '/winners_table_name', to: 'winners#index'
  get '/winners_table_name/:id/edit', to: 'winners#edit'
  get '/winners_table_name/:id', to: 'winners#show'
  patch '/winners_table_name/:id', to: 'winners#update'
  delete '/winners_table_name/:id', to: 'winners#destroy'

  #Triple Crown Series and Winners Routes
  get '/triples/:id/winners_table_name/new', to: 'triple_winners#new'
  get '/triples/:id/winners_table_name', to: 'triple_winners#index'
  post '/triples/:id/winners_table_name/create', to: 'triple_winners#create'

end