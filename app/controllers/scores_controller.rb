class ScoresController < ApplicationController
  def new
    @score = Score.new
    authorize @score
  end
  
  def create
    @score = Score.new(list_params)
    @score.user = current_user
    authorize @score
    if @score.save!
      redirect_to user_profile_path(current_user)
    else
      render :new
    end
  end


  private

  def list_params
    params.require(:score).permit(:annual_income, :crop, :ha, :garantia,:name, :lastname, :cpf, :rg, :dap, :experience, :iniplant, :endplant)
  end
end
