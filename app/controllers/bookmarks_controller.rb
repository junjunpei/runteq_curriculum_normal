class BookmarksController < ApplicationController
  def create
    # bookmark = current_user.bookmarks.build(board_id: params[:board_id])
    # bookmark.save
    # redirect_to boards_path, success: t('defaults.message.bookmark')
    @board = Board.find(params[:board_id])
    current_user.bookmark(@board)
    # redirct_back fallback_location: root_path, success: t('.success')
  end

  def destroy
    # current_user.bookmarks.find_by(board_id: params[:board_id]).destroy
    # redirect_to boards_path, success: t('defaults.message.unbookmark')
    @board = current_user.bookmarks.find(params[:id]).board
    current_user.unbookmark(@board)
    # redirect_back fallback_location: root_path, success: t('.success')
  end
end
