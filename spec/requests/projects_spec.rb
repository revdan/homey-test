require "rails_helper"

RSpec.describe "Projects", type: :request do
  let(:user) { create(:user) }

  describe "GET /index" do

    it "requires user to be authenticated" do
      sign_in user
      get root_path

      expect(response).to render_template(:index)
    end

    it "redirects if user is not authenticated" do
      get root_path

      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "SHOW /index" do
    let(:project) { create(:project) }

    describe "when user is signed in" do
      before do 
        sign_in user
        get project_path(project)
      end

      it "displays the correct page" do
        expect(response).to render_template(:show)
      end
    end

    it "redirects if user is not authenticated" do
      get project_path(project)

      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
