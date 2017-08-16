class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_item_params)
    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to @portfolio_item,
                      notice: "Portfolio Item successfuly created" }
      else
        format.html { render 'new',
                      notice: "something went wrong please try again" }
      end
    end
  end

    private

    def portfolio_item_params
      params.require(:portfolio).permit(:title, :subtitle, :body, :main_image,
                                        :thumb_image)
    end
end
