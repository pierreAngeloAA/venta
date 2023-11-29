class CategoriesController < ApplicationController
    before_action :category, only: [:show, :edit, :update, :destroy]

    def show
        category
        @subcategories = category.subcategories
    end
  
    def new
        @category_id = params[:category_id]
        @category = Category.new
    end
  
    def create
        @category = Category.new(category_params)

        if @category.save
         redirect_to category_path(@category), notice: 'Categoría creada con éxito.'
        else
         render :new
        end
    end
  
    def edit
        category
    end
  
    def update
        if category.update(category_params)
            redirect_to root_path, notice: 'Categoría actualizada con éxito.'
        else
            render :edit, status: :unprocessable_entity
        end
    end
  
    def destroy
        category.destroy
        redirect_to root_path, notice: 'Categoría eliminada con éxito.', status: :see_other
    end
  
    private
  
    def category
        @category = Category.find(params[:id])
    end
  
    def category_params
        params.require(:category).permit(
            :name,
            :parent_id
        )
    end
  end
  