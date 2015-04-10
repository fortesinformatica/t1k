require 'fileutils'

module T1k
  module Commands
    class Init

      def self.run
        src = File.join(T1k::path_to_resources, "T1000")
        dest = T1k::tthousand_path

        FileUtils.cp src, dest
      end

      def self.help
        <<-DESC
        init - Creates T1000 file into your project folder.
          Setup your keys and other configurations in this file.
        DESC
      end
    end
  end
end