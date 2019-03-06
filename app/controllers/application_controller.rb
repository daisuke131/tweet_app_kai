class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) # 新規登録
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image]) # 修正
  end

  # ログイン後の遷移先
  def after_sign_in_path_for(_resource)
    posts_path
  end
  # ログアウト後の遷移先
  def after_sign_out_path_for(_resource)
    new_user_session_path
  end
end
