require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before :each do
      get users_path
    end

    it 'renders users correctly' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the users/index template' do
      expect(response).to render_template('index')
    end

    it 'doesn\'t render a template other than users/index' do
      expect(response).to_not render_template('show')
    end

    it 'includes the correct placeholder in body for users/index' do
      expect(response.body).to include('You will be able to see the users listed here.')
    end
  end

  describe 'GET /show' do
    before :each do
      get user_path(id: 745)
    end

    it 'renders user\'s details correctly' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the users/745 template' do
      expect(response).to render_template('show')
    end

    it 'doesn\'t render a template other than users/745' do
      expect(response).to_not render_template('index')
    end

    it 'includes the correct placeholder in body for users/show' do
      expect(response.body).to include('You will be able to see the details and the posts of a specific user.')
    end
  end
end
