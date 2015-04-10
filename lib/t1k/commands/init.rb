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
        "init - Initialize a project with T1000 configuration file."
      end
    end
  end
end