class MasteriesController < ApplicationController
  include Authorization

  before_action :set_expert
  before_action :authenticate_expert!
  before_action :authorize_expert!

  def new
    @mastery = Mastery.new
    @services = Service.all
    @skills = Skill.where(service: Service.first)
  end

  def create
    @mastery = @expert.masteries.build(mastery_params)
    if @mastery.save
      redirect_to @expert, notice: 'Skill added.'
    else
      @services = Service.all
      @skills = Skill.where(service: Service.first)
      render 'new'
    end
  end

  private

  def mastery_params
    params.require(:mastery).permit(:skill_id, :description)
  end

  def set_expert
    @expert = Expert.find(params[:expert_id])
  end
end
