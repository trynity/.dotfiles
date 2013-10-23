require 'bundler/setup'
require 'rake'
require 'erubis'
require 'fileutils'
require 'yaml'
require 'os'

if OS.mac?
  require 'keychain'
  KEYCHAIN = Keychain.default
end

begin
  CONFIG = YAML::load(File.open('config.yml'))
rescue
  puts "No configuration file!"
  CONFIG = Hash.new
end

task :default => [:install]

desc "Install the dotfiles into user's home directory"
task :install do

  replace_all = false

  Dir['*'].each do |file|

    excluded = ['Rakefile', 'README.rdoc', 'LICENSE', 'Gemfile', 'Gemfile.lock', 'config.yml', 'ssh']
    next if excluded.include? file

    dotfile = File.join(ENV['HOME'], ".#{file}")

    if File.exist?(dotfile)
      if File.identical? file, dotfile
        puts "Identical ~/.#{file}"
      elsif replace_all
        link_file(file, true)
      else
        print "Overwrite ~/.#{file}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          link_file(file, true)
        when 'y'
          link_file(file, true)
        when 'q'
          exit
        else
          puts "Skipping ~/.#{file}"
        end
      end
    else
      link_file(file)
    end
  end
end

def link_file(file, force = false)
  if file =~ /.erb$/
    puts "Generating ~/.#{file.sub('.erb', '')}"
    file_path = File.join(ENV['HOME'], ".#{file.sub('.erb', '')}")
    File.open(file_path, 'w') do |new_file|
      new_file.write Erubis::Eruby.new(File.read(file)).result(binding)
    end
    # We generally don't want the world to read our lovely configs
    File.chmod(0600, file_path)
  else
    puts "Linking ~/.#{file}"
    ln_s "#{ENV['PWD']}/#{file}", "#{ENV['HOME']}/.#{file}", :force => force
  end
end
