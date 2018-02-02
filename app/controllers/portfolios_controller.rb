class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end
  def new
    @portfolio_item = Portfolio.new
  end
  # def create
  #   @portfolio_item = Portfolio.new(portfolio_params)
  #   if@portfolio_item.save
  #     flash[:notice] = "New portfolio succesfully created"
  #     redirect_to portfolios_path
  #   else
  #      render :new
  #   end
  # end
  def create
 @portfolio_item = Portfolio.new(portfolio_params)
    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio is now live.' }
      else
        format.html { render :new }
      end
    end
  end

  private
   def portfolio_params
     params[:portfolio].permit(:title, :subtitle, :body)
   end
end
