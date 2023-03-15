class HistoryItemPresenter < SimpleDelegator
  def type_badge
    case type
    when "HistoryComment" then "new comment"
    when "HistoryStatusChange" then "new status"
    end
  end
end
