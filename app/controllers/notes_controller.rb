class NotesController < ApplicationController
  before_action :set_note, only: %i[show edit update destroy]
  PER_PAGE = 5

  def index
    @notes = current_user.notes.order(date: :desc).includes(:user).page(params[:page]).per(PER_PAGE)
    # @notes = current_user.notes.order(date: :desc).includes(:user)
  end

  def new
    if current_user.notes.find_by(date: Date.today)
      # binding.pry
      redirect_to edit_note_path(id: current_user.notes.last.id), alert: "すでに本日の連絡帳が存在します"
    elsif current_user.calendars.find_by(date: Date.today)
      @note = Note.new(temp: 36.5, message: "よろしくおねがいします。")
    else
      redirect_to edit_calendars_path, alert: "本日の利用がありません。利用日を決めましょう。"
    end
  end

  def create
    @note = current_user.notes.new(note_params)
    @note.date = Date.current
    if @note.save
      # current_user.notes.create!(note_params)
      redirect_to note_path(@note), notice: "投稿しました"
    else
      binding.pry
      redirect_to root_path, alert: "すでに同日の連絡帳が存在します"
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

  def destroy
    @note.destroy!
    redirect_to notes_path, notice: "削除に成功しました"
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
