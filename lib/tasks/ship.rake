require 'rake'

#rake t1k:ship
namespace :t1k do
  desc "Faz merge com o master e pusha"

  task :ship do |t, args|
  	branch = `git branch | grep '*' | awk '{print $2}'`
		system "git checkout master"
		system "git pull --rebase"
		system "git merge #{branch.strip}"
		system "git commit -v"
		system "git push origin master"
  end
end