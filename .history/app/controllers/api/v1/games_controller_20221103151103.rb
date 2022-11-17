class Api::V1::GamesController < ApplicationController
  before_action :set_game, only: %i[:show, :update, :destroy]
  # before_action :authenticate_user!
  def index
    @games = Game.all
    render json: @games
  end

  def show
    render json: @games
  end

 def create
    @games = Game.new(valid_params)
    if @games.save
      render json: @games, status: :created
    else
      render json:  :unprocessable_entity
    end
  end

 def update
    @games = Game.find(params[:id])
    if @games
      @games.update(valid_params)
      render json: { message: 'Updated'}, status: :ok
    else
      render json: { message: 'Unable to be updated'}, status: :unprocessable_entity
    end
  end

  def destroy
    @games = Game.destroy(params[:id])
    if @games
      @games.destroy
      render json: {message:'Destroyed'}, status: :ok
    else
      render json: {error: 'Unable to Destroy'}, status: :internal_server_error
    end
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def valid_params
    params.require(:game).permit(:id,:name, :release_date, :platforms, :genre)
  end
end