class BookmarksController < ApplicationController
  def create
    bookmark = current_user.bookmarks.build(board_id: params[:board_id])
    bookmark.save
    redirect_to boards_path, success: t('defaults.message.bookmark')
  end

  def destroy
    current_user.bookmarks.find_by(board_id: params[:board_id]).destroy
    redirect_to boards_path, success: t('defaults.message.unbookmark')
  end
end
