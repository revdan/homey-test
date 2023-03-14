require "rails_helper"

RSpec.describe "HistoryItems", type: :request do
  let(:user) { create(:user) }
  let(:project) { create(:project) }

  describe "GET /index" do
    it "requires user to be authenticated" do
      sign_in user
      get project_history_items_path(project)

      expect(response).to render_template(:index)
    end

    it "redirects if user is not authenticated" do
      get project_history_items_path(project)

      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "POST /index" do
    before { sign_in user }

    it "posts comments" do
      expect {
        post project_history_items_path(project.id, format: :turbo_stream), params: {project_id: project.id, history_item: {type: "HistoryComment", body: "sdffd dsf  sdf"}}
      }.to change { HistoryItem.count }.by(1)
    end

    it "posts status changes" do
      expect {
        post project_history_items_path(project.id, format: :turbo_stream), params: {project_id: project.id, history_item: {type: "HistoryStatusChange", body: "sdffd dsf  sdf"}}
      }.to change { HistoryItem.count }.by(1)
    end

    it "doesn't post unknown types" do
      expect {
        post project_history_items_path(project.id, format: :turbo_stream), params: {project_id: project.id, history_item: {type: "RandomComment", body: "sdffd dsf  sdf"}}
      }.to raise_error(ActiveRecord::SubclassNotFound)
    end
  end
end
