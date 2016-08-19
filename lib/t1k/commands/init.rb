require 'fileutils'

module T1k
  module Commands
    class Init

      def self.run
        if Validate.credentials?
          puts "There is T1000 file inside your directory. Remove it before do init.".red
          exit 1
        end

        self.create_T1000_file

        puts "Setup your T1000 file".blue
      end


      def self.create_T1000_file
        src  = File.join(T1k::path_to_resources, "T1000")
        dest = T1k::tthousand_path

        FileUtils.cp(src, dest)
      end

      private_class_method :create_T1000_file
    end
  end
end
