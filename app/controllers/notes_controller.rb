class NotesController < ApplicationController
  before_action :set_note, only: %i[show edit update]

  def index
    @notes = current_user.notes.order(date: :desc).includes(:user)
  end

  def new
    @note = Note.new
  end

  def create
    current_user.notes.create!(note_params)
    redirect_to root_path
  end

  def show
  end

  def edit
  end

  def update
    @note.update!(note_params)
    redirect_to @note
  end

  private

  def note_params
    params.require(:note).permit(:date, :condition, :humor, :temp, :message)
  end

  def set_note
    @note = current_user.notes.find_by(id: params[:id])
    # redirect_to root_path, alert: "権限がありません"
  end
end
