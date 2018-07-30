class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
    @comment.user = current_user
    @comment.save!
    redirect_to article_path(@article)
  end

  def edit
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])

    if current_user != @comment.user
      redirect_to article_path(@article)
      flash[:alert] = "Not allow!!"
    end
  end

  def update
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      flash[:notice] = "updated comment successfully"
      redirect_to article_path(@article)
    else
      flash.now[:alert] = "failed to update comment"
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])

    if current_user == @comment.user || current_user.role == 'admin'
      @comment.destroy
      redirect_to article_path(@article)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
