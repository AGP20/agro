class ScoresController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def new
    @score = Score.new
    authorize @score
  end

  def create
    @score = Score.new(list_params)
    @score.user = current_user
    authorize @score
    if @score.save!
      @score.risk = calc_score(list_params)
      @score.save!
      redirect_to user_profile_path(current_user)
    else
      render :new
    end
  end


  private

  def list_params
    params.permit(:cpf, :crop, :name, :garantia, :dap, :experience, :ha, :annual_income)
  end

  def calc_score(prms)
    @var = PagesController.new
    #@token = @var.gettoken
    @farmer = prms
    if @farmer[:garantia].capitalize == 'Sim' && @farmer[:annual_income].to_i >= 50000
      @risk = 'Baixo Risco'
      #@score_risk.save!
    elsif @farmer[:garantia].capitalize == 'Sim' && @farmer[:annual_income].to_i < 50000
      @risk = 'Médio Risco'
    elsif @farmer[:garantia].capitalize == 'Não' && @farmer[:annual_income].to_i > 300000
      @risk = 'Baixo Risco'
    else
      @risk = 'Alto Risco'
    end
  end
end
