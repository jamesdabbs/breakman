desc "Breakify your app"
task :break do
  Breakman.break! Rails.root
end
