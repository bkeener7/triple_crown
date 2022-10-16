class TriplesController < ApplicationController
    def index
        @triples = Triple.all.sort_by(&:created_at).reverse
    end

    def show
        @triple = Triple.find(params[:id])
        @triplecount = @triple.winners.count
    end

end