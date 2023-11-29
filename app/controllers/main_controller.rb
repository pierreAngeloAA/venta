class MainController < ApplicationController
  before_action :authenticate_user!

  def home
    @categories = Category.all
    @root_categories = @categories.select { |category| category.parent_id.nil? }
  end
end
