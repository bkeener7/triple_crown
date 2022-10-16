class WinnersController < ApplicationController
    def index
        @winners = Winner.all
    end

    def show
        @winner = Winner.find(params[:id])
    end
end