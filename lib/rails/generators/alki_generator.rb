class AlkiGenerator < Rails::Generators::Base
  def create_initializer
    create_file "config/assembly.rb", <<END
Alki do    
  # elements go here ...
end
END
    create_file "config/initializers/alki.rb", <<END
module Rails::ConsoleMethods
  include Alki::Rails
end

class ActionController::Base
  include Alki::Rails
end
END
  end
end
