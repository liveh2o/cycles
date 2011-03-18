class IdeasController < ApplicationController
  # GET /ideas
  def index
    @ideas = Idea.includes(:app,:creator).all
  end

  # GET /ideas/1
  def show
    @idea = Idea.includes(:app,{:comments => :creator},:voters).find(params[:id])
  end

  # GET /ideas/new
  def new
    @idea = Idea.new
    @idea.comments.build
  end

  # GET /ideas/1/edit
  def edit
    @idea = current_user.ideas.find(params[:id])
  end

  # POST /ideas
  def create
    @idea = current_user.ideas.build(params[:idea])

    if @idea.save
      redirect_to(@idea, :notice => 'Idea was successfully created.')
    else
      render :action => "new"
    end
  end

  # PUT /ideas/1
  def update
    @idea = current_user.ideas.find(params[:id])

    if @idea.update_attributes(params[:idea])
      redirect_to(@idea, :notice => 'Idea was successfully updated.')
    else
      render :action => "edit"
    end
  end

  # PUT /ideas/1/upgrade
  def upgrade
    @idea = current_user.ideas.find(params[:id])
    @idea.upgrade
    
    redirect_to(@idea, :notice => "Idea has been upgraded to #{@idea.status}")
  end

  # DELETE /ideas/1
  def destroy
    @idea = current_user.ideas.find(params[:id])
    @idea.destroy

    redirect_to(ideas_url)
  end
end
