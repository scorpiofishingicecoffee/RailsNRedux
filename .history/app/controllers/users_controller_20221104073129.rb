class UsersController < ApplicationController
  def index
    users = User.all
    render json: @users
  end
  def show
  end
  def create
  end
end
