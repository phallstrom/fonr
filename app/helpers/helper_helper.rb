module HelperHelper

  def extract_helper_options(params)
    options = {}
    params.delete_if {|k,v| k !~ /^helper_/ || v.blank?}.each_pair do |k,v|
      if k.to_s =~ /^helper_(.*)_send_blank_string/
        options[$1.to_sym] = '""' 
      elsif k.to_s =~ /^helper_(.*)/
        options[$1.to_sym] ||= case v
                               when 'true' then true
                               when 'false' then false
                               else Integer(v) rescue Float(v) rescue "\"#{v.gsub(/"/, '\\"')}\""
                               end
      end
    end
    options.to_a.sort_by{|e| e.first.to_s}
  end

  def helper_invocation(prefix, params, suffix = ")")
    options = extract_helper_options(params)
    invocation = '<%= ' + prefix + (', ' unless options.blank?).to_s + options.map {|e| ":#{e.first} => #{e.last}" }.join(', ') + suffix + ' %>'
    invocation.gsub(/\#\{.*?\}/, '{SORRY}')
  end

end

