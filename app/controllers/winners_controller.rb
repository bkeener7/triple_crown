class WinnersController < ApplicationController
  before_action :find_winner, only: [:show, :edit, :update, :destroy]

  def index
    @winners = Winner.sired_winner
  end

  def show; end

  def edit; end

  def update
    @winner.update(winner_params)
    redirect_to "/winners_table_name/#{@winner.id}"
  end

  def destroy
    @winner.destroy
    redirect_to '/winners_table_name'
  end

  private

  def find_winner
    @winner = Winner.find(params[:id])
  end

  def winner_params
    params.permit(:name, :year_won, :jockey, :trainer, :sired_TC_winner)
  end
end
