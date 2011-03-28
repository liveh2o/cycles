class IdeasController < ApplicationController
  # GET /ideas
  def index
    @ideas = Idea.rank(:priority).includes(:app,:creator)
  end
  
  # GET /ideas/cycling
  def cycling
    @ideas = CyclingIdea.includes(:app,:creator)
    
    render :index
  end

  # GET /ideas/implemented
  def implemented
    @ideas = ImplementedIdea.includes(:app,:creator)
    
    render :index
  end

  # GET /ideas/scrapped
  def scrapped
    @ideas = ScrappedIdea.includes(:app,:creator)
    
    render :index
  end

  # GET /ideas/1
  def show
    @idea = Idea.includes(:app,{ :comments => :creator },:voters,:creator).find(params[:id])
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
      render :new
    end
  end

  # PUT /ideas/1
  def update
    @idea = current_user.ideas.find(params[:id])

    if @idea.update_attributes(params[:idea])
      redirect_to(@idea, :notice => 'Idea was successfully updated.')
    else
      render :edit
    end
  end

  # DELETE /ideas/1
  def destroy
    @idea = current_user.ideas.find(params[:id])
    @idea.scrap

    redirect_to(ideas_url, :notice => 'Idea was successfully scrapped.')
  end
end
