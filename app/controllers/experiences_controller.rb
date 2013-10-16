class ExperiencesController < ApplicationController
  def create
    @experience = @current_user.experiences.new(page_params)

    respond_to do |format|
      if @experience.save
        format.html { redirect_to :back }
        format.json { render action: 'show', status: :created, location: @experience }
      else
        format.html { redirect_to :back }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
  end

	def show
	end

	private
  # Never trust parameters from the scary internet, only allow the white list through.
  def page_params
    params.require(:experience).permit(:title, :company, :from_date, :to_date, :summary)
  end

end
