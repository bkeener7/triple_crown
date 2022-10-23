class WinnersController < ApplicationController
  def index
    @winners = Winner.all.sired_winner
  end

  def show
    @winner = Winner.find(params[:id])
  end

  def edit
    @winner = Winner.find(params[:id])
  end

  def update
    winner = Winner.find(params[:id])
    winner.update(winner_params)
    redirect_to "/winners_table_name/#{winner.id}"
  end

  def destroy
    Winner.find(params[:id]).destroy
    redirect_to('/winners_table_name')
  end

  private

  def winner_params
    params.permit(:name, :year_won, :jockey, :trainer, :sired_TC_winner)
  end
end
