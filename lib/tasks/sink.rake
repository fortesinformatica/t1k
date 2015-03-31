require 'rake'

#rake t1k:sink
namespace :t1k do
  desc "Sincroniza branch atual com o master"

  task :sink do |t, args|
  	branch = `git branch | grep '*' | awk '{print $2}'`
		system "git checkout master"
		system "git pull --rebase origin master"
		system "git checkout #{branch.strip}"
		system "git rebase master #{branch.strip}"
  end
end