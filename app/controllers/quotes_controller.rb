class QuotesController < ApplicationController
  def index
    @quotes = Quote.order(attributed: :asc).page params[:page]
  end

  def new
    @quote = Quote.new
    @header = 'New Quote'
    render 'form'
  end

  def create
    @quote = Quote.create quote_params
    redirect_to quotes_path, {flash: {success: "Record has been created"}}
  end

  def edit
    @quote = Quote.find params[:id]
    render 'form'
  end

  def update
    @quote = Quote.find params[:id]
    if @quote.update_attributes quote_params
      redirect_to quotes_path
    else
      render 'form'
    end
  end

  def destroy
    Quote.destroy params[:id]
    redirect_to quotes_path, {flash: {notice: "Record has been deleted"}}
  end

  private

  def quote_params
    params.require(:quote).permit(:attributed_id, :author_id, :quote)
  end
end
