class CalendarsController < ApplicationController
  # before_action :set_calendar, only: %i[edit update]

  def edit
    gon.selected_date = current_user.calendars.pluck(:date)
  end

  def update
    # if @calendar.nil?
    #   @calendar = current_user.calendars.create!(calendars_params)
    # elsif @calendar.present?
    #   @calendar.update!
    # else
    #   redirect_to root_path
    # end
  end

  private

  # def calendars_params
  #   params.require(:calendar).permit(:date)
  # end

  # def set_calendar
  #   date = Date.current
  #   range = date..date.next_month
  #   @calendar = current_user.calendars.where(date: range)
  #   @calendar = current_user.calendars
  # end
end
