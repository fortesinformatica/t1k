module T1k
  module Commands
    class Hack

      def self.run(path_card_part)
        code_card = T1k::hack path_card_part

        system 'git checkout master'
        system 'git pull --rebase origin master'
        existent_branch = `git branch --list #{code_card}`

        if existent_branch.present?
          system "git checkout #{code_card}"
        else
          system "git checkout -b #{code_card}"
        end
      end

      def self.help
        <<-DESC
        hack <card_identifier> - creates a branch associated with a card and checkout to it.
        DESC
      end
    end
  end
end