require 'rails_helper'

RSpec.feature 'Transactions', type: :feature do
  before do
    @user = User.create(name: 'Tumaini', email: 'tumaini@gmail.com', password: 'password123')
    sign_in @user
    @group = Group.create(name: 'Cinema', icon: 'https://www.earth-image.com', user: @user)
    @entity = Exchange.create(name: 'First transaction', amount: 978, user: @user)
    visit "/groups/#{@group.id}"
  end

  scenario 'displays the total amount of transactions' do
    expect(page).to have_content("Total Amount #{@categories_total}")
  end

  it 'should have a list of transactions' do
    expect(page).to have_selector('.transanction-list', count: 1)
  end

  it 'should have no value' do
    expect(page).to have_content('There is no transanction for now')
  end

  scenario 'allows users to add a new transaction' do
    click_link 'Add New Transanction'

    expect(current_path).to eq new_group_exchange_path(@group.id)
  end
end
