class SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:password])
    if @user
      sign_in(@user)
      redirect_to links_url(@user)
    else
      flash[:errors] = ["Incorrect username/password combo"]
      render :new
    end

  end

  def new
    @user = User.new
    render :new
  end

  def destroy
    sign_out
    render :new
  end


end
