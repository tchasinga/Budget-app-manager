require_relative '../rails_helper'

RSpec.describe Exchange, type: :model do
  describe 'validation' do
    before(:each) do
      @user = User.create(
        name: 'tumaini',
        email: 'tumainimaganiko@mail.com',
        password: 'password'
      )
      @category = Group.create(user: @user, name: 'Test Cat', icon: 'https://earth-image')
      @transanction = Exchange.create(user: @user, name: 'Transanction 1', amount: 200)
    end

    it 'requires name to be present' do
      @transanction.name = nil
      expect(@transanction).not_to be_valid
    end

    it 'requires amount to be present' do
      @transanction.amount = 200
      expect(@transanction).to be_valid
    end
  end
end
