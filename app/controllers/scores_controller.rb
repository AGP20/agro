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
      @score_risk = calc_score(list_params)
    else
      render :new
    end
  end

  
  private

  def list_params
    params.require(:score).permit(:annual_income, :crop, :ha, :garantia, :name, :lastname, :cpf, :rg, :dap, :experience, :iniplant, :endplant)
  end

  def calc_score(prms)
    @var = PagesController.new
    @token = @var.gettoken
    @farmer = prms
      if @farmer[:garantia] == 'Sim' && @farmer[:annual_income].to_i >= 50000
        @risk = 'Baixo Risco'
      elsif @farmer[:garantia] == 'Sim' && @farmer[:annual_income].to_i < 50000
        @risk = 'Médio Risco'
      elsif @farmer[:garantia] == 'Não' && @farmer[:annual_income].to_i > 300000
        @risk = 'Baixo Risco'
      else
        @risk = 'Alto Risco'
      end
    end
  end
