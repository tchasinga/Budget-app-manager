require 'rails_helper'

describe 'Categories page', type: :feature do
  include Capybara::DSL
  before :each do
    @user = User.create(name: 'Tumaini', email: 'tumainimaganiko@gmail.com', password: 'password123')
    sign_in @user
    @groupe = Group.create(name: 'Category 1', icon: 'https://www.earth-image.com', user: @user)
    @entity = Exchange.create(name: 'First transaction', amount: 800, user: @user)
    visit groups_path
  end

  it 'should have a header with the text categories' do
    expect(page).to have_selector('h1.new-category-heading', text: 'Categories')
  end

  it 'should have a ul tag' do
    expect(page).to have_css('ul.categories-list')
  end

  it 'should have a list of categories' do
    expect(page).to have_selector('.my-6', count: 1)
  end

  scenario 'allows users to add a new category' do
    click_link 'Add New Category'

    expect(current_path).to eq new_group_path
  end
end
