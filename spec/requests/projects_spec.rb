require "rails_helper"

RSpec.describe "Projects", type: :request do
  describe "GET /index" do
    let(:user) { create(:user) }

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
end
