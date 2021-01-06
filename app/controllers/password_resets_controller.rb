class PasswordResetsController < ApplicationController
  skip_before_action :require_login

  def new; end

  def create
    @user = User.find_by(email: params[:email])
    @user&.deliver_reset_password_instructions!
    redirect_to root_path, success: t('defaults.message.send_email')
  end

  def edit
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])
    # if @user.blank?
    #   not_authenticated
    #   return
    # end
    return not_authenticated if @user.blank?
  end

  def update
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])

    # if @user.blank?
    #   not_authenticated
    #   return
    # end
    return not_authenticated if @user.blank?

    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.change_password(params[:user][:password])
      redirect_to login_path, success: t('defaults.message.changed_password')
    else
      render :edit
    end
  end
end
