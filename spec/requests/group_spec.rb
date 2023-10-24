require 'rails_helper'

RSpec.describe 'Group', type: :request do
  before :each do
    @user = User.create(name: 'Tumaini', email: 'tumainimaganiko@example.com', password: 'password')
    sign_in @user
    @group = Group.create(name: 'Cinema', icon: 'https://www.earth-image.com', user: @user)
    @entity = Exchange.create(name: 'First transaction', amount: 900, user: @user)
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get '/groups'
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get '/groups'
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      get "/groups/#{@group.id}"
      expect(response).to have_http_status(200)
    end

    it 'renders the categorie\'s form' do
      get '/groups/new'
      expect(response).to render_template('new')
    end
  end
end
