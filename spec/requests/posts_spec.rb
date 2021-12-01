require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before :each do
      get user_posts_path(745)
    end

    it 'renders posts correctly' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the users/:user_id/posts template' do
      expect(response).to render_template('index')
    end

    it 'doesn\'t render a template other than users/:user_id/posts' do
      expect(response).to_not render_template('show')
    end

    it 'includes the correct placeholder in body for users/:user_id/posts' do
      expect(response.body).to include('You will be able to see the posts from a specific user here.')
    end

    describe 'GET /show' do
      before :each do
        get user_post_path(745, 3)
      end

      it 'renders post\'s details correctly' do
        expect(response).to have_http_status(:ok)
      end

      it 'renders the users/:user_id/posts/:post_id template' do
        expect(response).to render_template('show')
      end

      it 'doesn\'t render a template other than users/:user_id/posts/:post_id' do
        expect(response).to_not render_template('index')
      end

      it 'includes the correct placeholder in body for users/:user_id/posts/:post_id' do
        expect(response.body).to include('You will be able to see the details of a post here.')
      end
    end
  end
end
