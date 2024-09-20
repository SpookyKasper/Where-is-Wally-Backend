class ScoresController < ApplicationController
  def index
    scores = Score.all
    render json: scores
  end

  def show
    score = Score.find(params[:id])
    render json: score
  end

  def create
    score = Score.create(score_params)
    render json: score, status: :created
  end

  def update
    score = Score.find(params[:id])
    if score.update(score_params)
      render json: score, status: :ok
    else
      render json: score.errors, status: :uprocessable_entity
    end
  end


  private

  def score_params
    params.require(:score).permit(:name)
  end
end
