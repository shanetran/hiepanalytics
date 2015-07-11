class SalesController < ApplicationController
  def index
    @sales = Sale.page(params[:page]).per(10)
  end

  def search
    search_day_from = params[:search_sales_day_from]
    search_day_to = params[:search_sales_day_to]
    @sales = Sale.search_day_ranger(search_day_from, search_day_to).page(params[:page]).per(10)
    @products = Product.page(params[:page]).per(10)
  end

  def new
    @sale = Sale.new
  end

  def create
    if Sale.new(sales_params).save
      redirect_to root_path, :flash => { :success => "Sản phẩm được tạo thành công." }
    else
      redirect_to new_sale_path, :flash => { :error => "Sản phẩm tạo không thành công." }
    end
  end

  def edit
    @sale = Sale.find(params[:id])
  end

  def update
    @sale = Sale.find(params[:id])
    if @sale.update(sales_params)
      redirect_to root_path, :flash => { :success => "Sản phẩm lưu thành công." }
    else
      render 'edit', :flash => { :error => "Sản phẩm lưu không thành công." }
    end
  end

  def destroy
    if Sale.find(params[:id]).destroy
      redirect_to root_path, :flash => { :success => "Sản phẩm đã xoá thành công." }
    else
      redirect_to root_path, :flash => { :error => "Sản phẩm xoá không thành công." }
    end
  end

  def sales_params
    params.require(:sale).permit(:sale_day, :quantity, :price, :capital)
  end
end
