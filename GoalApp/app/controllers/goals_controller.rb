class GoalsController < ApplicationController
    def new
        @goal = Goal.new
        render :new
    end

    # When you first sign up
    def create
        @goal = Goal.new(goal_params)
        if @goal.save
            login(@goal)
            redirect_to goal_url(@goal)
        else
            # debugger
            flash.now[:errors] = @goal.errors.full_messages
            render :new
        end
    end

    def destroy
        @goal = Goal.find(params[:id])
        @goal.destroy
        redirect_to goals_url
    end

    def show
        @goal = Goal.find(params[:id])
        render :show
    end

    
    # goals
    def index
        @goals = current_user.goals
        render :index
    end

    private

    def goal_params
        params.require(:goal).permit(:body, :user_id, :completed, :visibility)
    end

end
