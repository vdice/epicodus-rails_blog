class UsersController < ApplicationController
  before_action :find_user, except: [:new, :create, :index]

  def show
  end

  private
  def find_user
    @user = User.find(params[:id])
  end
end
