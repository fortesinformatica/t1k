module T1k
  module Trackers
    class None

      Card = Struct.new(:name)

      def self.setup &block
      end

      def self.get_card title, board=nil
        Card.new title
      end

      def self.update_card card, issue
      end
    end
  end
end
