class ReceptionsController < ApplicationController
  before_action :set_reception, only: %i[edit show update]

  def edit
  end

  def show
    if @reception.nil?
      flash[:alert] = "まだ本日の受付がありません"
      redirect_to root_path
    end
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

  def set_reception
    range = Date.today.beginning_of_day..Date.today.end_of_day
    @reception = current_user.receptions.find_by(arrive: range)
  end

  # def receptions_params
  #   params.require(:reception).permit(:arrive, :leave)
  # end

end
