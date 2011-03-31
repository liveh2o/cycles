#encoding: utf-8
module IdeasHelper
  def app_options
    App.all.collect {|a| [a.name, a.id] }
  end
  
  def back_to_ideas_link(idea)
    case
    when idea.is_a?(Idea)
      type = 'shared'
      path = ideas_path
    when idea.is_a?(CyclingIdea)
      type = 'cycling'
      path = cycling_ideas_path
    when idea.is_a?(ImplementedIdea)
      type = 'implemented'
      path = implemented_ideas_path
    when idea.is_a?(ScrappedIdea)
      type = 'scrapped'
      path = scrapped_ideas_path
    end
    
    link_to("← Back to #{type} ideas", path, :id => 'link-back')
  end
  
  def cycle_button(idea)
    unless idea.implemented?
      if idea.cycling?
        button_to 'Implemented', '#', :class => 'gray button smallest'
      else
        button_to 'Start cycle', '#', :class => 'gray button smallest'
      end
    end
  end
  
  def escalate_button(idea)
    escalate_text = idea.escalated? ? 'De-escalate' : 'Escalate'
    button_to escalate_text, escalate_idea_path(idea), :method => :put, :confirm => 'Are you sure?', :class => 'gray button smallest' if idea.escalateable?
  end
  
  def escalated_or_votes(idea)
    if idea.escalated?
      "escalated"
    else
      "#{idea.votes_count} votes"
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
