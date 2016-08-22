require 'clive'

module Kernel
  def system(cmd)
    puts "#{cmd} was called".green.bold
  end
end
