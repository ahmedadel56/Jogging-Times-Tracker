class V1::JoggingTimesController < ApplicationController
  load_and_authorize_resource

  def index
    @user_jogging_times = User.includes(:jogging_times).find(params[:user_id])
    # render json: @user_jogging_times.jogging_times.where(date: params[:date]).order("created_at DESC")
    if params[:from].nil? && !params[:to].nil?
      render json: @user_jogging_times.jogging_times.where('date <= ?', params[:to]).order('created_at DESC')
    elsif !params[:from].nil? && params[:to].nil?
      render json: @user_jogging_times.jogging_times.where('date >= ?', params[:from]).order('created_at DESC')

    elsif !params[:from].nil? && !params[:to].nil?
      render json: @user_jogging_times.jogging_times.where('date >= ? AND date <= ?', params[:from],
                                                           params[:to]).order('created_at DESC')
    else
      render json: @user_jogging_times.jogging_times.order('created_at DESC')
    end
  end

  def show
    @jogging_time = JoggingTime.find_by(id: params[:id], user_id: params[:user_id])
    render json: @jogging_time
  end

  def create
    @jogging_time = JoggingTime.new(jogging_time_params)
    @jogging_time.user_id = params[:user_id]
    if @jogging_time.save
      render json: @jogging_time
    else
      render json: @jogging_time.errors, status: :unprocessable_entity
    end
  end

  def update
    @jogging_time = JoggingTime.find_by(id: params[:id], user_id: params[:user_id])
    if @jogging_time.update(jogging_time_params)
      render json: { status: 200, message: 'Jogging time updated successfully!' }
    else
      render json: { status: 206, message: 'Jogging Time is not updated ' }
    end
  end

  def destroy
    @jogging_time = JoggingTime.find(params[:id])
    if @jogging_time.destroy
      render json: { status: 200, message: 'Jogging Time deleted successfully!' }
    else
      render json: { status: 206, message: 'Jogging Time is not deleted ' }

    end
  end

  private

  def jogging_time_params
    params.permit(
      :minutes,
      :distance,
      :date
    )
  end

  def jogging_time_sort_params
    params.permit(
      :from,
      :date
    )
  end
end
