class Admin::BaseController < ApplicationController
  before_action :check_admin
  layout 'admin/layouts/application'

  private

  def check_admin
    redirect_to root_path, danger: t('defaults.message.no_authority') unless current_user.admin?
  end
end
