class SalesController < ApplicationController
  def index
    @sales = Sale.page(params[:page]).per(2)
  end

  def search
    search_day_from = params[:search_sales_day_from]
    search_day_to = params[:search_sales_day_to]
    @sales = Sale.search_day_ranger(search_day_from, search_day_to).page(params[:page]).per(2)
    @products = Product.page(params[:page]).per(2)
  end

  def new
    @sale = Sale.new
  end

  def create
    if Sale.new(sales_params).save
      redirect_to root_path
    else
      redirect_to new_sale_path
    end
  end

  def edit
    @sale = Sale.find(params[:id])
  end

  def update
    @sale = Sale.find(params[:id])
    if @sale.update(sales_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    Sale.find(params[:id]).destroy
    redirect_to root_path
  end

  def sales_params
    params.require(:sale).permit(:sale_day, :quantity, :price, :capital)
  end
end
