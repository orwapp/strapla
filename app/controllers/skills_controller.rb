class SkillsController < ApplicationController

  def index
    @skills = Skill.order(:title)
    #raise "Searching for #{params[:q]}"
    respond_to do |format|
      format.html
      #format.json { render json: Skill.where("title like ?", "%#{params[:q]}%") }
      format.json { render json: Skill.where("title like ?", '%R%').select(:id, :title).to_json }
    end
  end

end
