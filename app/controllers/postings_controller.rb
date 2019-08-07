class PostingsController < ApplicationController
  def index
    @postings = Posting.all
  end

  def new
    @posting = Posting.new
  end

  def create
    @posting = Posting.create(content: params[:posting][:content])
    if @posting.save
      redirect_to postings_path, notice: "投稿を作成しました！"
    else
      render :new
    end
  end

  def show
    @posting = Posting.find(params[:id])
  end

  def edit
    @posting = Posting.find(params[:id])
  end

  def update
    @posting = Posting.find(params[:id])
      if @posting.update(content: params[:posting][:content])
        redirect_to postings_path, notice: "投稿を編集しました！"
      else
        render :edit
      end
  end

end
