class ReceptionsController < ApplicationController
  # before_action :set_reception, only: %i[show update destroy]

  def show
    range = Date.today.beginning_of_day..Date.today.end_of_day
    # if current_user.receptions.where(arrive)
    @reception = current_user.receptions.find_by(arrive: range)
  end

  def update
  end

  def destroy
    @reception.destroy!
    redirect_to receptions_path
  end

  # private

  # def reception_params
  #   params.require(:reception).permit(:arrive, :leave)
  # end
end
