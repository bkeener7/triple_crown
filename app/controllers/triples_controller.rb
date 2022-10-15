class TriplesController < ApplicationController
    def index
        @triples = Triple.all
    end
end