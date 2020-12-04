class ReceptionsController < ApplicationController
  before_action :set_reception, only: %i[show update destroy]

  def show
  end

  def update
    if @reception.nil?
      @reception = current_user.receptions.create!(arrive: Time.current)
      # binding.pry
    elsif @reception.leave.nil?
      @reception.update!(leave: Time.current)
    else
      redirect_to receptions_path
    end
  end

  def destroy
    # @reception.destroy!
    # redirect_to receptions_path
  end

  private

  def set_reception
    range = Date.today.beginning_of_day..Date.today.end_of_day
    @reception = current_user.receptions.find_by(arrive: range)
  end

  # def receptions_params
  #   params.require(:reception).permit(:arrive, :leave)
  # end

end
