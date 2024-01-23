class AreasController < ApplicationController
  def index
    @root_categories = Category.areas
  end
end
