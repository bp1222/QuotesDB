class QuotesController < ApplicationController
  def index
    @quotes = Quote.all
  end

  def new
    @quote = Quote.new
    @params = params[:commit];
  end

  def create
  end
end
