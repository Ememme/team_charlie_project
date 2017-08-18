class OffersController < ApplicationController
  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new
    if @offer.save
      redirect_to :root, notice: 'Offer was successfully created'
    end
  end

  def show
    @offer = Offer.find(params[:id]).decorate
  end

  def index
    @offers = Offer.includes(:currency, :technologies, :skills_requirements, :company).filter_technologies(params[:search]).decorate

  end

  def destroy
    @offer = Offer.find(params[:id]).destroy
    flash[:success] = "Offer destroyed"
  end
end
