class CalendarsController < ApplicationController
  # before_action :set_calendar, only: %i[edit update]

  def edit
    gon.selected_date = current_user.calendars.pluck(:date) if current_user.calendars.present?
    # 30日以内を取得するコードをここに書く

  end

  def update
    submitted_dates = params[:calendar][:date].split(" ").map(&:to_date)
    save_dates = submitted_dates - current_user.calendars.pluck(:date)
    save_dates.each do |save_date|
      current_user.calendars.create!(date: save_date)
      # binding.pry
    end
    delete_dates = current_user.calendars.pluck(:date) - submitted_dates
    current_user.calendars.where(date: delete_dates).destroy_all
    redirect_to root_path
  end

  # private

  # def set_calendar
  #   date = Date.current
  #   range = date..date.next_month
  #   @calendar = current_user.calendars.where(date: range)
  #   @calendar = current_user.calendars
  # end
end
