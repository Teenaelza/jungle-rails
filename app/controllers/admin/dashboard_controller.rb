class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['HTTP_AUTH_USER_NAME'], password: ENV['HTTP_AUTH__PASSWORD']
  def show
    @product_count=Product.all.count
    @category_count=Category.all.count
  end
end
