class SkillsController < ApplicationController

  def index
    @skills = Skill.order(:title)
    respond_to do |format|
      format.html
      format.json { render json: Skill.where("name iLIKE ?", "%#{params[:q]}%").select(:id, :name).to_json }
    end
  end

end
