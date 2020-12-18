class NotesController < ApplicationController
  before_action :set_note, only: %i[show edit update destroy]

  def index
    @notes = current_user.notes.order(date: :desc).includes(:user)
  end

  def new
    @note = Note.new(temp: 36.5, message: "よろしくおねがいします。")
  end

  def create
    @note = current_user.notes.new(note_params)
    if @note.save
      # current_user.notes.create!(note_params)
      redirect_to root_path, notice: "投稿しました"
    else
      redirect_to root_path, alert: "すでに同日の連絡帳が存在します"
    end
  end

  def show
  end

  def edit
  end

  def update
    @note.update!(update_params)
    flash[:notice] = "更新しました"
    redirect_to root_path
  end

  def destroy
    @note.destroy!
    redirect_to root_path, notice: "削除に成功しました"
  end

  private

  def note_params
    params.require(:note).permit(:date, :condition, :humor, :temp, :message).merge({ date: Date.current })
  end

  def update_params
    params.require(:note).permit(:date, :condition, :humor, :temp, :message)
  end

  def set_note
    @note = current_user.notes.find_by(id: params[:id])
    if @note.nil?
      redirect_to root_path, alert: "権限がありません"
    end
  end
end
