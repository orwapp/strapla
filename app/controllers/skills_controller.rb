class SkillsController < ApplicationController

  def index
    @skills = Skill.order(:name)
    respond_to do |format|
      format.html
      #format.json { render json: Skill.where("name iLIKE ?", "%#{params[:q]}%").select(:id, :name).to_json }
      format.json { render json: Skill.tokens(params[:q]) }
    end
  end

end
