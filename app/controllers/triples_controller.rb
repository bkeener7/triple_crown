class TriplesController < ApplicationController
    def index
        @triples = Triple.all
    end

    def show
        @triple = Triple.find(params[:id])
    end
end