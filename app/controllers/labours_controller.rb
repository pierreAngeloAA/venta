class LaboursController < ApplicationController
  def index
    if params[:category_id].present?
      @labours = Labour.root_labour(params[:category_id])
    else
      @labours = Labour.all
    end
  end

  def new  
    @labour = Labour.new
    @category_id = params[:category_id].to_i
  end
  
  def create
    @labour = Labour.new(labour_params)

    if @labour.save
      redirect_to labours_path, notice: 'Labor creada con éxito.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    labour
    @category_id = labour.category_id
  end

  def update
    if labour.update(labour_params)
      redirect_to labours_path notice: 'Labor actualizada con éxito.'
    else
      render :edit
    end
  end

  def destroy
    @category_id = labour.category_id
    labour.destroy
    redirect_to labours_path, alert: 'Labor eliminada con éxito.'
  end

  private

  def labour
    @labour = Labour.find(params[:id])
  end

  def labour_params
    params.require(:labour).permit(
      :category_id,
      :description,
      :start_date,
      :end_date
      )
  end
end
