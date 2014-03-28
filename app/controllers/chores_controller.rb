class ChoresController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
      chores = chore_params.collect { |chore| Chore.new(chore) }
      all_chores_valid = true
      chores.each do |chore|
        unless chore.save
          all_chores_valid = false
        end
      end

      respond_to do |format|
        if all_chores_valid
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

  def show
    @chores = Chore.all
    respond_to do |format|
      format.json { render json: @chores }
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def chore_params
    params['_json']
  end
end