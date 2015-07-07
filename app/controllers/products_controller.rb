class ProductsController < ApplicationController
  def index
    @products = Product.all
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

  def product_params
    params.require(:product).permit(:name, :quantity)
  end
end
