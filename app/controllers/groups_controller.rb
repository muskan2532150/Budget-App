class GroupsController < ApplicationController
    before_action :authenticate_user!

    def index
        # @groups = Group.joins(:user).where(users: {id: current_user.id})
        @groups= current_user.groups
        @count=@groups.count

      end
    
      def show
        @group = Group.find(params[:id])
      end
    
      def new
        @group = Group.new
      end
    
      def create
        @group = Group.new(group_params)
        @group.user_id = current_user.id
        if @group.save
          redirect_to groups_path
        else
          render "new", status: :unprocessable_entity
        end
      end
    
      def group_params
        params.require(:group).permit(:name, :icon, :user_id)
      end
end
