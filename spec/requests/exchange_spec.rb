require 'rails_helper'

RSpec.describe 'Entity', type: :request do
  before :each do
    @user = User.create(name: 'Test', email: 'test2@example.com', password: 'password')
    sign_in @user
    @group = Group.create(name: 'Cinema', icon: 'https://www.thestreet.com', user: @user)
    @entity = Exchange.create(name: 'First transaction', amount: 9000, user: @user)
    # @group.entities << @entity
  end

  describe 'GET #new' do
    it 'returns a successful response' do
      get "/groups/#{@group.id}/exchanges/new"
      expect(response).to have_http_status(200)
    end

    it 'renders the categorie\'s form' do
      get "/groups/#{@group.id}/exchanges/new"
      expect(response).to render_template('new')
    end
  end
end
