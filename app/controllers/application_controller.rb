class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_idea
  helper_method :current_user
  
  private
    def current_idea
      @current_idea ||= idea.find(params[:idea_id] || params[:id]) if
        params[:idea_id].present? || controller_name =~ /ideas/
    end
  
    def current_user
      @current_user ||= Person.first
    end
end
