class HomeController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(2)
    @sales = Sale.page(params[:page]).per(2)
  end
end
