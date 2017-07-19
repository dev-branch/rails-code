require 'rails_helper'

RSpec.describe CalcController, type: :controller do
  render_views

  describe "GET /calc" do
    it "shows no history" do
      get :show
      expect(assigns(:history).size).to eql(0)
      expect(response.status).to eq(200)
      expect(response).to render_template("show")
      # http://rubular.com/
      expect(response.body).to match(/<ul>\s*<\/ul>/)
    end
  end

  describe "POST /calc" do
    it "adds to history" do
      post :compute, :params => { :problem => '3 ** 4' }
      expect(response.status).to eq(302)
      expect(response).to redirect_to '/calc'
      get :show
      expect(assigns(:history).size).to eql(1)
    end
  end

  describe "DELETE /calc" do
    it "nuke it from space" do
      delete :delete
      expect(response.status).to eq(302)
      expect(response).to redirect_to '/calc'
    end
  end
end
