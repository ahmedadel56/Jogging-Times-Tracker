class V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :authorize_request, only: :create

  before_action :authenticate_v1_user!
  load_and_authorize_resource

  def index
    render json: User.all
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auth_token = AuthenticateUser.new(user.email, user.password).call
      sign_in @user
      render json: { status: 201, message: 'User created successfully!', content: { auth_token: } }
    else
      render json: { status: 206, message: 'User is not created successfully!' }

    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: { status: 201, message: 'User Updated successfully!', content: @user }
    else
      render json: { status: 206, message: 'User is not Updated' }

    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy!
      render json: { status: 201, message: 'user deleted successfully!' }
    else
      render json: { status: 401, message: 'Failed to remove!' }
    end
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
