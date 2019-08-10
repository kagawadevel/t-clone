class PostingsController < ApplicationController
  before_action :set_posting, only:[:show, :edit, :update, :destroy]

  def index
    @postings = Posting.all
  end

  def new
    @posting = Posting.new
  end

  def create
    @posting = Posting.create(posting_params)
    if @posting.save
      redirect_to postings_path, notice: "投稿を作成しました！"
    else
      render :new
    end
  end

  def show
    set_posting
  end

  def edit
    set_posting
  end

  def update
    set_posting
      if @posting.update(posting_params)
        redirect_to postings_path, notice: "投稿を編集しました！"
      else
        render :edit
      end
  end

  def destroy
    set_posting.destroy
    redirect_to postings_path, notice:"投稿を削除しました！"
  end

  def confirm
    @posting = Posting.new(posting_params)
  end


  private

  def posting_params
    params.require(:posting).permit(:content)
  end

  def set_posting
    @posting = Posting.find(params[:id])
  end

end
