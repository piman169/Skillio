class RelationshipsController < ApplicationController
    def create
        user = User.find(params[:follow_id])
        following = @current_user.follow(user)
        if following.save
          flash[:notice] = 'ユーザーをフォローしました'
          redirect_to("/users/#{@current_user.id}")
        else
          flash[:notice] = 'ユーザーのフォローに失敗しました'
          redirect_to("/users/#{@current_user.id}")
        end
    end
    
    def destroy
        user = User.find(params[:follow_id])
        following = @current_user.unfollow(user)
        if following.destroy
          flash[:success] = 'ユーザーのフォローを解除しました'
          redirect_to("/users/#{@current_user.id}")
        else
          flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
          redirect_to("/users/#{@current_user.id}")
        end
    end
end
