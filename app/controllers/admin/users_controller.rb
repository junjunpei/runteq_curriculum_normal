class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).recent.page(params[:page])
  end

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to admin_user_path(@user), success: t('defaults.message.updated', item: User.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: User.model_name.human)
      render :edit
    end
  end

  def destroy
    @user.destroy!
    redirect_to admin_users_path, success: t('defaults.message.deleted', item: User.model_name.human)
  end

  private

  def user_params
    params.require(:user).permit(:email, :last_name, :first_name, :avatar, :role)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
