class MasteriesController < ApplicationController
  def new
    @expert = Expert.find(params[:expert_id])
    @mastery = Mastery.new
    @services = Service.all
    @skills = Skill.where(service: Service.first)
  end

  def create
    @expert = Expert.find(params[:expert_id])
    skill = Skill.find(params[:mastery][:skill_id])
    mastery = Mastery.new(expert: @expert, skill: skill)
    if mastery.save
      redirect_to @expert
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
