class TripleWinnersController < ApplicationController
    def index
        @triple = Triple.find(params[:id])
        @winners = @triple.winners
    end
end