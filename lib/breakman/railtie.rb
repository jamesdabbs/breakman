class Breakman
  class Railtie < ::Rails::Railtie
    rake_tasks do
      load "breakman/tasks.rake"
    end
  end
end
