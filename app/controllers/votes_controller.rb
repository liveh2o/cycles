class VotesController < ApplicationController

  # POST /idea/1/votes
  def create
    @vote = current_idea.votes.build
    @vote.person_id = current_user.id

    if @vote.save
      flash[:notice] = "+1 for #{current_idea.name}." 
    else
      flash[:warning] = "You already voted for this idea."
    end
    
    redirect_to(@vote.idea)
  end
end
