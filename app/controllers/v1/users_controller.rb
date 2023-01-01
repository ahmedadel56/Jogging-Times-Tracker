class V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authorize_request, only: :create

  load_and_authorize_resource

  def index
    render json: User.all
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email, user.password).call
    render json: { status: 201, message: 'User created successfully!', content: { auth_token: } }
  end

  def destroy
    sign_out
    render json: { status: 200, message: 'User removed successfully!' }
  end

  private

  def user_params
    params.permit(
      :name,
      :email,
      :password,
      :role
    )
  end
end
