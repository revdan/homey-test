class HistoryItemsController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @history_items = @project.history_items.ordered.map(&:decorate)
  end

  def create
    @item = HistoryItem.new(history_item_params.merge(project_id: params[:project_id], user_id: current_user.id))

    if @item.save
      respond_to do |format|
        format.html do
          redirect_to project_history_items_path(params[:project_id]), notice: "History Item was successfully created."
        end
        format.turbo_stream do
          render turbo_stream: turbo_stream.prepend(:history_items, partial: "history_items/history_item",
            locals: {history_item: @item.decorate})
        end
      end
    end
  end

  def history_item_params
    params.require(:history_item).permit(:body, :type)
  end
end
