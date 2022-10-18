class TripleWinnersController < ApplicationController
    def index
        @triple = Triple.find(params[:id])
        @winners = @triple.winners.order(params[:sort_param])
    end

    def new
        @triple = Triple.find(params[:id])
    end

    def create
        @triple = Triple.find(params[:id])
        @triple.winners.create!(triple_winner_params)
        redirect_to "/triples/#{@triple.id}/winners_table_name"
    end

private
    def triple_winner_params
        params.permit(:name, :year_won, :jockey, :trainer, :sired_TC_winner)
    end
end