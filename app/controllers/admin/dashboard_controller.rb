class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: "Jungle", password: "book"  
  
  def show
    @products = Product.all.count
    @category = Category.all.count
    
  end
end
