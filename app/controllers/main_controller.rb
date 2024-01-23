class MainController < ApplicationController
  before_action :authenticate_user!

  def home
    @root_categories = Category.areas
  end
end
