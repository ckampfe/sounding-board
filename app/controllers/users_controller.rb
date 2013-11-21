class UsersController < ApplicationController
  def new

  end

  def create
    @user = User.find_or_create_by_email(params[:user])

    current_user = @user.id

    redirect_to "/"
  end

  def index

  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

end