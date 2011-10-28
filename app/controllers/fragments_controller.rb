#encoding: utf-8
class FragmentsController < ApplicationController
  load_and_authorize_resource

  def new
    @project = Project.find(params[:project_id])
    @fragment = @project.fragments.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fragment }
    end
  end

  # POST /fragments
  # POST /fragments.json
  def create
    

    @project = Project.find(params[:project_id])
    @fragment = @project.fragments.build(params[:fragment])

    respond_to do |format|
      if @fragment.save
        format.html { redirect_to @project, notice: 'Fragment was successfully created.' }
        format.json { render json: @fragment, status: :created, location: @fragment }
      else
        format.html { render action: "new" }
        format.json { render json: @fragment.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @fragment = Fragment.find(params[:id])
    @project = @fragment.project
    respond_to do |f|
      f.js
    end
  end

  def update
    @fragment = Fragment.find(params[:id])

    respond_to do |format|
      if @fragment.update_attributes(params[:fragment])
        format.js { flash[:notice] = "Fragment verändert"
                    render "fragment_text"}
      end
    end
    
  end

  def destroy
  end

  def index
  end

  def show
    @project = Project.find(params[:project_id])
    @comments = @fragment.comments
    @comment = Comment.new
  end

end
