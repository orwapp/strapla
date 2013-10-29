class SkillsController < ApplicationController

  def index
    @skills = Skill.order(:title)
    #raise "Searching for #{params[:q]}"
    respond_to do |format|
      format.html
      format.json { render json: Skill.where("name like ?", '%R%').select(:id, :name).to_json }
    end
  end

end