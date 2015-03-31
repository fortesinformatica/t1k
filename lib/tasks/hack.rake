require 'rake'

# rake t1k:hack['uD2GBBMf'] 
namespace :t1k do
  desc "Cria issue e atualiza cartão do trello"

  task :hack, [:path_card_part] do |t, args|
  	code_card = T1k::hack args[:path_card_part]
  	puts "Cartão #{code_card} criado"

		system 'git checkout master'
		system 'git pull --rebase origin master'
		system "git checkout -b #{code_card}"
  end
end