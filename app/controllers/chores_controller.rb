class ChoresController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    @chore = Chore.new(chore_params)

    respond_to do |format|
      if @chore.save
        format.json { render nothing: :true, status: :created }
      else
        format.json { render nothing: :true, status: :unprocessable_entity }
      end
    end
  end

  def update
    @chore = Chore.find(params[:chore_id])

    respond_to do |format|
      if @chore.update(chore_params)
        format.json { head :no_content }
      else
        format.json { render json: @chore.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def chore_params
    params.require(:chore).permit(:chore_id, :title, :description, :due_date, :is_done)
  end
end
