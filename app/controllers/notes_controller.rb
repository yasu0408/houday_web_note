class NotesController < ApplicationController
  before_action :set_note, only: %i[show edit update]

  def index
    @notes = current_user.notes.order(date: :desc).includes(:user)
  end

  def new
    @note = Note.new(temp: 36.5, message: "よろしくおねがいします。")
  end

  def create
    # binding.pry
    @note = Note.new(note_params)
    if @note.save
      current_user.notes.create!(note_params)
      flash[:notice] = "投稿しました"
      redirect_to root_path
    else
      flash[:alert] = "すでに本日の連絡帳が存在しています"
      redirect_to root_path
    end
  end

  def show
  end

  def edit
  end

  def update
    @note.update!(note_params)
    flash[:notice] = "更新しました"
    redirect_to root_path
  end

  private

  def note_params
    params.require(:note).permit(:date, :condition, :humor, :temp, :message)
  end

  def set_note
    @note = current_user.notes.find_by(id: params[:id])
    if @note.nil?
      redirect_to root_path, alert: "権限がありません"
    end
  end
end
