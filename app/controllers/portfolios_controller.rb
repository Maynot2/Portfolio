class PortfoliosController < ApplicationController
  before_action :get_portfolio_item, only: [:show, :edit, :update, :destroy]

  def index
    @portfolio_items = Portfolio.all
  end

  def show
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def edit
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

  def update
    @portfolio_item.update(portfolio_item_params)
    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to @portfolio_item,
                      notice: "Portfolio Item successfuly updated" }
      else
        format.html { render 'new',
                      notice: "something went wrong please try again" }
      end
    end
  end

  def destroy
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url,
                    notice: "Portfolio Item successfuly removed"}
    end
  end

    private

    def get_portfolio_item
      @portfolio_item = Portfolio.find(params[:id])
    end

    def portfolio_item_params
      params.require(:portfolio).permit(:title, :subtitle, :body, :main_image,
                                        :thumb_image)
    end
end
