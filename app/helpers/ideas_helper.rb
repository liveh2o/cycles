module IdeasHelper
  def app_options
    App.all.collect {|a| [a.name, a.id] }
  end
  
  def cycle_button(idea)
    unless idea.implemented?
      if idea.cycling?
        button_to 'Implemented', '#'
      else
        button_to 'Start cycle', '#'
      end
    end
  end
end
