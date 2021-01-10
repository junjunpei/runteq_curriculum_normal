module ApplicationHelper
  def full_title(page_title = '', admin = false)
    base_title = if admin
                   'RUNTEQ BOARD APP(管理画面)'
                 else
                   'RUNTEQ BOARD APP'
                 end

    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end
end
