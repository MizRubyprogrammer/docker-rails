class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.save
      flash[:notice]="コメントを投稿しました"
      redirect_to  comment.board
      # アソシエーションでコメント、ボードを繋げているのでboard_idを取得可
    else
      redirect_to :back,flash: {
        comment: comment,
        error_messages: comment.errors.full_messages
      }
    end
      # :backで一つ前の画面に戻る。url代わり

  end

  def destroy
    comment = Comment.find(params[:id])
    comment.delete
    redirect_to comment.board, flash:{notice: 'コメントが削除されました'}
  end

  private
  def comment_params
    params.require(:comment).permit(:board_id, :name, :comment)
  end
end
