class TriplesController < ApplicationController
    def index
        @triples = Triple.all.order_by_created_at
    end

    def show
        @triple = Triple.find(params[:id])
    end
    
    def new
    end

    def create
        new_triple = Triple.create!(triple_params)
        redirect_to '/triples'
    end

    def edit
        @triple = Triple.find(params[:id])
    end

    def update
        triple = Triple.find(params[:id])
        triple.update(triple_params)
        redirect_to "/triples/#{triple.id}"
    end

    def destroy
        triple = Triple.find(params[:id])
        triple.destroy
        redirect_to('/triples')
    end

private
    def triple_params
        params.permit(:country, :year_established, :dirt_track)
    end
end