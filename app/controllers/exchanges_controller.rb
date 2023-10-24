class ExchangesController < ApplicationController
  before_action :authenticate_user!

  def new
    @transanction = Exchange.new
    @current_user = current_user
    @category_map = @current_user.groups.pluck(:name, :id)
  end

  def create
    new_transanction = Exchange.new(transanction_params)
    new_transanction.user = current_user
    respond_to do |format|
      if new_transanction.save
        group = Group.find_by(id: params[:category])
        CategoryExchange.create(group:, exchange: new_transanction)
        format.html { redirect_to group_path(id: group.id), notice: 'Transanction was successfully created.' }
        format.json { render :index, status: :created, location: new_transanction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transanction.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def transanction_params
    params.require(:exchange).permit(:name, :amount, user: current_user)
  end
end
