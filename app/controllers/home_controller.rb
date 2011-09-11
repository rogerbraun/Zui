class HomeController < ApplicationController
  def index
    if user_signed_in?
      @projects = current_user.projects + current_user.shared_projects
      @comments = Comment.limit(10).order("updated_at desc").all
    end
  end

end
