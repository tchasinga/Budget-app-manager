class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = current_user.groups
    @current_user = current_user
    @total = CategoryExchange
    @categories_total = 0
  end

  def show
    @groups = current_user.groups.includes(category_exchanges: :exchange).find_by(id: params[:id])
    @categories = @groups.category_exchanges.order('created_at DESC')
    @categories_total = 0
  end

  def new
    @category = Group.new
    @current_user = current_user
  end

  def create
    new_category = Group.new(category_params)
    new_category.user = current_user
    respond_to do |format|
      if new_category.save
        format.html { redirect_to '/groups', notice: 'Category was successfully created.' }
        format.json { render :index, status: :created, location: new_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def category_params
    params.require(:group).permit(:name, :icon, user: current_user)
  end
end
