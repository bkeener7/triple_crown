class TripleWinnersController < ApplicationController
  before_action :find_triple, only: [:index, :new, :create]

  def index
    @winners = @triple.winners.order(params[:sort_param])
    @winners = @winners.year_filter(params[:year_filter]) unless params[:year_filter].nil?
  end

  def new; end

  def create
    @triple.winners.create!(triple_winner_params)
    redirect_to "/triples/#{@triple.id}/winners_table_name"
  end

  private

  def find_triple
    @triple = Triple.find(params[:id])
  end

  def triple_winner_params
    params.permit(:name, :year_won, :jockey, :trainer, :sired_TC_winner)
  end
end
