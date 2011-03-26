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
  
  def ideas_nav
    nav = ''.html_safe
    nav += link_to_unless_current 'shared', ideas_path
    %w(cycling implemented scrapped).each do |type|
      nav += link_to_unless_current(type, eval("#{type}_ideas_path"))
    end
    nav
  end
end
