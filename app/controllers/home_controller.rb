class HomeController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(10)
    @sales = Sale.page(params[:page]).per(10)
  end
end
