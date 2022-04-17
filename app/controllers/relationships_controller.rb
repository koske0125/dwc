class RelationshipsController < ApplicationController

  before_action :authenticate_user!

  def create
    following = current_user.relationships.build(followed_id: params[:user_id])
    following.save
    redirect_back(fallback_location: users_path)
  end

  def destroy
    remove = current_user.relationships.find_by(followed_id: params[:user_id])
    remove.destroy
    redirect_back(fallback_location: users_path)
  end

end
