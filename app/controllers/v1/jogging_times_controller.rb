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

  def weekly_report
    if params[:date].nil?
      render json: { error: 'please enter proper date' }
    else
      @date = Date.parse params[:date]
      # days_to_week_start is a built in methode that provides previous sunday date based on the date you provide
      # As a muslim week starts at saturday that's why I added +2  to days_to_week_start
      @days_after_saturday = (@date.days_to_week_start + 2)
      @week_beginning_date = @date - @days_after_saturday
      @user_jogging_times = User.includes(:jogging_times).find(params[:user_id])
      @filterd_user_jogging_times = @user_jogging_times.jogging_times.where('date >= ? AND date <= ?',
                                                                            @week_beginning_date, @date)
      @distance = 0
      @time = 0
      @filterd_user_jogging_times.each do |jogging_time|
        @distance += jogging_time[:distance]
        @time += jogging_time[:minutes]
      end
      render json: { speed_average: "#{@distance / @time} m / minute",
                     distance_average: "#{@distance / @days_after_saturday} m / day" }
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
