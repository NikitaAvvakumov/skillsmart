class ExpertsController < ApplicationController
  include Authorization

  before_action :set_expert
  before_action :authenticate_user!, only: [:show]
  before_action :authorize_expert!, except: [:show]

  def show
    @masteries = @expert.masteries
    @skills = @expert.skills
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
end
