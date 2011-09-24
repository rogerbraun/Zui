#encoding: utf-8
class CommentsController < ApplicationController
  def create
    @fragment= Fragment.find(params[:fragment_id])
    @comment = @fragment.comments.build(params[:comment])
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        @comments = @fragment.comments 
        format.js { flash[:notice] = "Kommentar erstellt."
                    render "index" }
        format.html { redirect_to [@fragment.project, @fragment], notice: 'Comment was successfully created.' }
      else
        #format.html { render action: "new" }
        #puts @fragment.errors
        #format.json { render json: @fragment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @fragment = Fragment.find(params[:fragment_id])
    @comments = @fragment.comments 
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.js { flash[:notice] = "Kommentar verändert"
                    render "index"}
      end
    end
  end

  def reply
    @parent = Comment.find(params[:comment_id])
    @fragment = @parent.fragment
    @project = @fragment.project
    @comment = Comment.new
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @fragment = Fragment.find(params[:fragment_id])
    @comments = @fragment.comments 
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.js { flash[:notice] = "Kommentar gelöscht"
                  render "index" }
    end
  end

  def new
  end

  def edit
    @comment = Comment.find(params[:id])
    @fragment = @comment.fragment
    @project = @fragment.project
    respond_to do |format|
      format.js
    end
  end

  def index
    @comments = Fragment.find(params[:fragment_id]).comments
    respond_to do |format|
      format.js
    end 
  end

end
