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
  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end

  def update
    @portfolio_item = Portfolio.find(params[:id])
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @portfolio_item = Portfolio.find(params[:id])
  end

  def destroy
    @portfolio_item = Portfolio.find(params[:id])
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio was successfully destroyed.' }
    end
  end

  private
   def portfolio_params
     params[:portfolio].permit(:title, :subtitle, :body)
   end
end
