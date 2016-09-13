require 'clive'

module Kernel
  def system(cmd)
    puts "#{cmd}".green.bold
  end

  def `(cmd)
    if cmd == "git branch | grep '*' | awk '{print $2}'"
      'branch_name'
    else
      puts "#{cmd}".green.bold
    end
  end
end
