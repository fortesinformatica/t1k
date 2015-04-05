require 'rake'

#rake t1k:commit['comentario do commit',close]
namespace :t1k do
  desc "Commit using issue's info to track it down with github"

  task :commit, [:comment, :close] do |t, args|
  	closed = args[:close] == 'close' ? "close " : ""
  	branch = `git branch | grep '*' | awk '{print $2}'`
		system "git commit -m '[#{closed}##{branch.strip}] #{args[:comment]}'"
  end
end