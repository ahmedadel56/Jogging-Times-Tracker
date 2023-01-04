class V1::AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: %i[authenticate login logout]

  def authenticate
    auth_token = AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    json_response(auth_token:)
  end
# rubocop:disable all
  def login
    @user = User.find_by_email(params[:email])
    if @user&.valid_password?(params[:password])
      sign_in @user
      current_user = @user
      auth_token = AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
      render json: { status: 201, message: 'User login successfully!', content: { auth_token: }, user_id: @user.id }
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end
# rubocop:enable all

  def logout
    # sign_out current_user
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    # render json: {:success => true }.to_json, status: :200

    render json: { status: 200, message: 'User logout successfully!', user: current_user }
  end

  private

  def auth_params
    params.permit(:email, :password)
  end
end
