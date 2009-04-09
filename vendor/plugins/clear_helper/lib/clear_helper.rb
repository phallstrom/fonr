# ClearHelper

module ActionView
  module Helpers
    module TagHelper

      #
      # 
      #
      def clear(clear = 'both', height = '0')
        options = {}
        if clear.is_a?(Hash)
          options = clear.stringify_keys.reverse_merge!('clear' => 'both', 'height' => '0')
        else
          unless %w[left right both].include?(clear.to_s)
            height = clear
            clear = 'both'
          end
          options['height'] = height
          options['clear'] = clear
        end
        if options['height'].to_i.to_s == options['height'].to_s
          options['height'] = "#{options['height']}px" unless options['height'].to_s == '0'
        end

        options.reverse_merge!('max-height' => options['height'],
                               'font-size' => options['height'],
                               'line-height' => options['height'])

        # the sort is really just so the tests pass easily
        %Q{<div style="#{options.map {|e| "#{e.first}: #{e.last}" }.sort.join('; ')}">&nbsp;</div>}
      end

    end
  end
end
