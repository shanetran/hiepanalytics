class ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(2)
  end

  def search
    search_day_from = params[:search_day_from]
    search_day_to = params[:search_day_to]
    @products = Product.search_day_ranger(search_day_from, search_day_to).page(params[:page]).per(2)
    @sales = Sale.page(params[:page]).per(2)
  end

  def new
    @product = Product.new
  end

  def create
    if Product.new(product_params).save
      redirect_to root_path
    else
      redirect_to new_product_path
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    Product.find(params[:id]).destroy
    redirect_to root_path
  end

  def product_params
    params.require(:product).permit(:name, :buy_day, :quantity, :price)
  end
end
