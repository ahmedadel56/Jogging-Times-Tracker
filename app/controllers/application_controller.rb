class ApplicationController < ActionController::Base
  # skip_before_action :verify_authenticity_token
  protect_from_forgery with: :exception, unless: :json_request
  before_action :update_allowed_parameters, if: :devise_controller?
  before_action :authorize_request, if: :json_request

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end

  def json_request
    request.format.json?
  end

  private

  def authorize_request
    header = request.headers['Authorization']
    header = header.split.last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    end
    # rescue JWT::DecodeError => e
    #   render json: { errors: 'login' }, status: :unauthorized
    # end
  end
end

# end
