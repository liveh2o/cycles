class CommentsController < ApplicationController
  # GET /comments/1/edit
  def edit
    @comment = current_user.comments.find(params[:id])
  end

  # POST /ideas/1/comments
  def create
    @comment = current_idea.comments.build(params[:comment])

    if @comment.save
      flash[:notice] = 'Comment was successfully created.'
    end

    redirect_to(current_idea)
  end

  # PUT /comments/1
  def update
    @comment = current_user.comments.find(params[:id])

    if @comment.update_attributes(params[:comment])
      redirect_to(current_idea, :notice => 'Comment was successfully updated.')
    else
      render :action => "edit"
    end
  end

  # DELETE /comments/1
  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy

    redirect_to(current_idea)
  end
end
