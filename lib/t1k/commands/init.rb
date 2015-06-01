require 'fileutils'

module T1k
  module Commands
    class Init

      def self.run
        if Validate.credentials?
          puts "There is T1000 file inside your directory. Remove it before do init".red
          exit 1
        end

        src = File.join(T1k::path_to_resources, "T1000")
        dest = T1k::tthousand_path

        FileUtils.cp src, dest

        puts "Setup your T1000 file".blue
      end
    end
  end
end