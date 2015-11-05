class SkillsController < ApplicationController
  def index
    @skills = Skill.where(service: params[:service_id])
    respond_to { |format| format.js }
  end
end
