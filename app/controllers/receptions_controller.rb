class ReceptionsController < ApplicationController
  before_action :today_reception
  before_action :set_reception, only: %i[edit show update]

  def edit
  end

  def show
  end

  def update
    if @reception.nil?
      @reception = current_user.receptions.create!(arrive: Time.current)
    elsif @reception.leave.nil?
      @reception.update!(leave: Time.current)
    else
      redirect_to receptions_path, notice: "受付完了しました"
    end
  end

  # def destroy
  # @reception.destroy!
  # redirect_to receptions_path, notice: "削除に成功しました"
  # end

  private

  def today_reception
    if current_user.calendars.find_by(date: Date.today).nil?
      redirect_to edit_calendars_path, alert: "本日の利用がありません。利用日を決めましょう。"
    end
  end

  def set_reception
    range = Date.today.beginning_of_day..Date.today.end_of_day
    @reception = current_user.receptions.find_by(arrive: range)
  end
end
