class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :configure_account_update_parameters, if: :devise_controller?

	before_action :authenticate_user!

	before_action :set_current_user
	protected

	def configure_permitted_parameters
	  added_attrs = [ :email, :username, :password, :password_confirmation ]
	  devise_parameter_sanitizer.permit :sign_up, keys: [:name]
	  devise_parameter_sanitizer.permit :account_update, keys: [:name, :introduction, :image,:password]
	  devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
	end
	def configure_account_update_parameters
		devise_parameter_sanitizer.permit(:account_update, keys: [:name, :introduction, :image,:password])
	  end

	# ログイン後、home#topに移動する
	def after_sign_in_path_for(resource)
		root_path
	end
	# ログアウト後、home#topに移動する
	def after_sign_out_path_for(resource)
		root_path
	end
	def set_current_user
		@current_user = User.find_by(id: session[:user_id])
	end

end
