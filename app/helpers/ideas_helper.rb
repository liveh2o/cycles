module IdeasHelper
  def app_options
    App.all.collect {|a| [a.name, a.id] }
  end
  
  def cycle_button(idea)
    unless idea.implemented?
      if idea.cycling?
        button_to 'Implemented', upgrade_idea_path(idea), :method => :put
      else
        button_to 'Start cycle', upgrade_idea_path(idea), :method => :put
      end
    end
  end
end
