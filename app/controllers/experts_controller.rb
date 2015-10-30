class ExpertsController < ApplicationController
  before_action :set_expert
  before_action :authenticate_expert!
  before_action :authorize_expert!, except: [:show]

  def show
  end

  def edit
  end

  def update
    if @expert.update(expert_params)
      redirect_to @expert
    else
      render 'edit'
    end
  end

  def destroy
    @expert.destroy
    redirect_to root_url
  end

  private

  def set_expert
    @expert = Expert.includes(:skills).find(params[:id])
  end

  def expert_params
    params.require(:expert).permit(:first_name, :last_name)
  end

  def authorize_expert!
    redirect_to root_url unless current_expert == @expert
  end
end
