class ExpertsController < ApplicationController
  include Authorization

  before_action :set_expert, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:show, :index]
  before_action :authorize_expert!, except: [:show, :index]

  def index
    @services = Service.all
    if params[:skills]
      search_for_experts_with_given_skills
    else
      all_experts
    end
  end

  def show
    @expert = Expert.find(params[:id])
    @masteries = @expert.masteries.includes(:skill)
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

  def paginated(query)
    query.paginate(page: params[:page], per_page: 25)
  end

  def search_for_experts_with_given_skills
    @service = params[:services]
    @skills = Service.find(@service).skills
    @selected_skills = params[:skills]
    @experts = paginated(Expert.search_by_skills(params[:skills]))
  end

  def all_experts
    @experts = paginated(Expert.includes(:skills))
    @skills = Service.first.skills
  end
end
