module IdeasHelper
  def app_options
    App.all.collect {|a| [a.name, a.id] }
  end
end
