class LaboursController < ApplicationController
  before_action :find_labour, only: [:edit, :destroy, :update]

  def index
    if params[:skill_id].present?
      @labours = Labour.root_labour(params[:skill_id])
    else
      @labours = Labour.all
    end
  end

  def new
    @labour = Labour.new
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
  end

  def update
    if @labour.update(labour_params)
      redirect_to labours_path notice: 'Labor actualizada con éxito.'
    else
      render :edit
    end
  end

  def destroy
    @labour.destroy
    redirect_to labours_path, alert: 'Labor eliminada con éxito.'
  end

  private

  def find_labour
    @labour = Labour.find(params[:id])
  end

  def labour_params
    params.require(:labour).permit(:skill_id,:title)
  end
end
