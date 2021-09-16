class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["USER_NAME"], password: ENV["PASSWORD"]
  def show
    @productshow = Product.count
    @categorieshow = Category.count
  end
end
