class TriplesController < ApplicationController
  before_action :find_triple, only: [:show, :edit, :update, :destroy]

  def index
    @triples = Triple.order_by_created_at
  end

  def show; end

  def new; end

  def edit; end

  def create
    new_triple = Triple.create!(triple_params)
    redirect_to triples_path
  end

  def update
    @triple.update(triple_params)
    redirect_to "/triples/#{@triple.id}"
  end

  def destroy
    @triple.destroy
    redirect_to triples_path
  end

  private

  def find_triple
    @triple = Triple.find(params[:id])
  end

  def triple_params
    params.permit(:country, :year_established, :dirt_track)
  end
end
