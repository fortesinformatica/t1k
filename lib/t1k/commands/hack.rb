module T1k
  module Commands
    class Hack

      def self.run(path_card_part, board=nil)
        T1k.setup_credentials
        code_card = T1k::hack path_card_part, board

        system 'git checkout master'
        system 'git pull --rebase origin master'
        existent_branch = `git branch --list #{code_card}`

        if existent_branch.present?
          system "git checkout #{code_card}"
        else
          system "git checkout -b #{code_card}"
        end
      end
    end
  end
end
