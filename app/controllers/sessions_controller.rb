class SessionsController < ApplicationController
  def new
  end

  def create

    if params[:registration_key].present?
      @user = User.find_by user_name: params[:registration_key]
      if @user.present? && @user.authenticate(params[:registration_key])
        session[:user_id] = @user.id
        flash[:notice] = 'Signed in successfully.'
        redirect_to edit_user_url(@user.id)
      else
        flash.now[:error] = 'Something went wrong. Please try again.'
        render 'new'
      end
    else
      @user = User.find_by user_name: params[:username]

      if @user.present? && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        flash[:notice] = 'Signed in successfully.'
        redirect_to root_url
      else
        flash.now[:error] = 'Something went wrong. Please try again.'
        render 'new'
      end
    end
  end

  def destroy
    reset_session
    flash[:notice] = 'Signed out successfully.'
    redirect_to root_url
  end
end
