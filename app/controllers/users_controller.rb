class UsersController < ApplicationController
  before_action :authenticate_user!:authenticate_user!
  def show
    @user = current_user
  end
end
