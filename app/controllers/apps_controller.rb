class AppsController < ApplicationController
  # GET /apps
  def index
    @apps = App.all
  end

  # GET /apps/1
  def show
    @app = App.find(params[:id])
  end

  # GET /apps/new
  def new
    @app = App.new
  end

  # GET /apps/1/edit
  def edit
    @app = App.find(params[:id])
  end

  # POST /apps
  def create
    @app = App.new(params[:app])

    if @app.save
      redirect_to(apps_url, :notice => 'App was successfully created.')
    else
      render :action => "new"
    end
  end

  # PUT /apps/1
  def update
    @app = App.find(params[:id])

    if @app.update_attributes(params[:app])
      redirect_to(apps_url, :notice => 'App was successfully updated.')
    else
      render :action => "edit"
    end
  end

  # DELETE /apps/1
  def destroy
    @app = App.find(params[:id])
    @app.destroy

    redirect_to(apps_url)
  end
end
