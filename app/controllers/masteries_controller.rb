class MasteriesController < ApplicationController
  def new
    @expert = Expert.find(params[:expert_id])
    @mastery = Mastery.new
    @services = Service.all
    @skills = Skill.where(service: Service.first)
  end

  def create
    @expert = Expert.find(params[:expert_id])
    @mastery = @expert.masteries.build(mastery_params)
    if @mastery.save
      redirect_to @expert
    else
      @services = Service.all
      @skills = Skill.where(service: Service.first)
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def mastery_params
    params.require(:mastery).permit(:skill_id, :description)
  end
end
