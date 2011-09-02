class UserController < ApplicationController
  def index
    @users = User.where("email like ?", "%#{params[:q]}%") 
    respond_to do |format|
      format.json { render :json => @users.map(&:attributes) }
    end
  end
end
