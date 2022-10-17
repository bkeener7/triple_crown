class TriplesController < ApplicationController
    def index
        @triples = Triple.all.sort_by(&:created_at).reverse
    end

    def show
        @triple = Triple.find(params[:id])
        @triplecount = @triple.winners.count
    end
    
    def new
    end

    def create
        new_triple = Triple.create!(triple_params)
        redirect_to '/triples'
    end

    def triple_params
        params.permit(:country, :year_established, :dirt_track)
    end

end