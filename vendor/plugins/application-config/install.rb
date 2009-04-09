require 'fileutils'

app_config = File.dirname(__FILE__) + '/fixtures/application_config.yml'
new_config = File.dirname(__FILE__) + "/../../../config/application_config.yml"

unless File.exist?(new_config)
  puts "Creating default config file: #{new_config}"
  FileUtils.cp app_config, new_config
  puts "Setup complete!\n\n"
end

puts IO.read(File.join(File.dirname(__FILE__), 'README'))