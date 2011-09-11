#encoding: utf-8
class CommentsController < ApplicationController
  def create
    @fragment= Fragment.find(params[:fragment_id])
    @comment = @fragment.comments.build(params[:comment])
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        @comments = @fragment.comments 
        format.js {redirect_to project_fragment_comments_path, notice: "Kommentar erstellt"}
        format.html { redirect_to [@fragment.project, @fragment], notice: 'Comment was successfully created.' }
      else
        #format.html { render action: "new" }
        #puts @fragment.errors
        #format.json { render json: @fragment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.js {redirect_to project_fragment_comments_path, notice: "Kommentar gelöscht"}
    end
  end

  def new
  end

  def edit
  end

  def index
    @comments = Fragment.find(params[:fragment_id]).comments
    respond_to do |format|
      format.js
    end 
  end

end
