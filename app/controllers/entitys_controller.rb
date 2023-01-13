class EntitysController < ApplicationController
  access user: :all, admin: :all
  def index
    @group = Group.find(params[:group_id])
    @entitys = Entity.where(group_id: @group.id, user_id: current_user.id)
  end

  def new
    @entity = Entity.new
  end

  def create
    @entity = Entity.new(entity_params)
    @entity.user_id = current_user.id
    if @entity.save
      redirect_to group_entitys_path(@entity.group_id)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def entity_params
    params.require(:entity).permit(:name, :amount, :user_id, :group_id)
  end
end
