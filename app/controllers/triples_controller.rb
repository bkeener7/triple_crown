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
        new_triple = Triple.create!(country: params[:country], year_established: params[:year_established], dirt_track: params[:dirt_tracks_only])
        redirect_to '/triples'
    end

end