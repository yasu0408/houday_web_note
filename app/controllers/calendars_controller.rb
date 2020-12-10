class CalendarsController < ApplicationController
  def edit
    gon.selected_date = current_user.calendars.pluck(:date) if current_user.calendars.present?
  end

  def update
    submitted_dates = params[:calendar][:date].split(" ").map(&:to_date)
    save_dates = submitted_dates - current_user.calendars.pluck(:date)
    list = save_dates.map do |date|
      { user_id: current_user.id, date: date }
    end
    # list = []
    # save_dates.each do |save_date|
    #   hash = { user_id: current_user.id, date: save_date }
    #   list << hash
    Calendar.import!(list)

    # save_dates.each do |save_date|
    #   current_user.calendars.create!(date: save_date)
    # end

    delete_dates = current_user.calendars.pluck(:date) - submitted_dates
    current_user.calendars.where(date: delete_dates).delete_all
    redirect_to root_path
  end
end
