class ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(10)
  end

  def search
    search_day_from = params[:search_day_from]
    search_day_to = params[:search_day_to]
    @products = Product.search_day_ranger(search_day_from, search_day_to).page(params[:page]).per(10)
    @sales = Sale.page(params[:page]).per(10)
  end

  def new
    @product = Product.new
  end

  def create
    if Product.new(product_params).save
      redirect_to root_path, :flash => { :success => "Sản phẩm được tạo thành công." }
    else
      redirect_to new_product_path, :flash => { :error => "Sản phẩm tạo không thành công." }
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to root_path, :flash => { :success => "Sản phẩm lưu thành công." }
    else
      render 'edit', :flash => { :error => "Sản phẩm lưu không thành công." }
    end
  end

  def destroy
    if Product.find(params[:id]).destroy
      redirect_to root_path, :flash => { :success => "Sản phẩm đã xoá thành công." }
    else
      redirect_to root_path, :flash => { :error => "Sản phẩm xoá không thành công." }
    end
  end

  def product_params
    params.require(:product).permit(:name, :buy_day, :quantity, :price)
  end
end
