class BasketsController < ApplicationController
  def show
    @basket = Basket.find(params[:id])
  end

  def new
    @basket = Basket.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
