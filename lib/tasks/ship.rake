require 'rake'

#rake t1k:ship
namespace :t1k do
  desc "It merges the current branch with master and push"

  task :ship do |t, args|
  	branch = `git branch | grep '*' | awk '{print $2}'`
		system "git checkout master"
		system "git pull --rebase"
		system "git merge #{branch.strip}"
		system "git commit -v"
		system "git push origin master"
  end
end