class CalendarsController < ApplicationController
  before_action :set_calendar, only: %i[edit update]
  DATE_SCOPE = Date.today..(Date.today + 30)

  def edit
    gon.valid_dates = @scope_db_dates & DATE_SCOPE.to_a
  end

  def update
    submitted_dates = params[:calendar][:date].split(" ").map(&:to_date)
    valid_dates = submitted_dates & DATE_SCOPE.to_a

    save_dates = valid_dates - @scope_db_dates
    list = save_dates.map do |date|
      { user_id: current_user.id, date: date }
    end

    Calendar.import!(list)
    delete_dates = current_user.calendars.pluck(:date) - submitted_dates
    current_user.calendars.where(date: delete_dates).delete_all
    redirect_to root_path
  end

  private

  def set_calendar
    @scope_db_dates = current_user.calendars.where(date: DATE_SCOPE).pluck(:date)
  end
end
