module ActionView
  module Helpers 
    module UrlHelper

      def link_out_to(*args, &block)
        if block_given?
          args[1] = {:target => 'out'}.merge(args[1] || {})
        else
          args[2] = {:target => 'out'}.merge(args[2] || {})
        end
        link_to(*args, &block)
      end
    end
  end
end
