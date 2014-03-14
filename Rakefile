require 'bundler/setup'
require 'rake'
require 'fileutils'
require 'yaml'
require 'os'

require 'erubis'
require 'tilt'

if OS.mac?
  require 'keychain'
  KEYCHAIN = Keychain.default
end

task :default => [:install]

desc "Install the dotfiles into user's home directory"
task :install do
  dots = Dotfiles.new
  dots.run
end

class Dotfiles

  def initialize
    @replace = false
    @excluded = %w(Rakefile README.md LICENSE Gemfile Gemfile.lock config.yml ssh history src)
    @files = (Dir['**/**'] - @excluded).sort

    begin
      @config = YAML::load(File.open('config.yml'))
    rescue
      exit "No configuration file!"
    end
  end

  def prompt(file)
    print "Overwrite ~/.#{file}? [ynaq] "
    return $stdin.gets.chomp
  end

  def run
    @files.each do |file|
      @dotfile = File.join(ENV['HOME'], ".#{file}")
      if File.directory?(file)
        mkdir(file)
      elsif File.identical?(file, @dotfile)
        puts "Identical ~/.#{file}"
      elsif template? file
        generate(file)
      elsif !@replace
        overwrite(file)
      elsif @replace
        link(file)
      end
    end
  end

  def mkdir(file)
    path = "#{ENV['HOME']}/.#{file}"
    File.unlink(path) if File.symlink?(path)
    Dir.mkdir(path) unless Dir.exists?(path)
  end

  def link(file, force = false)
    @dotfile = File.join(ENV['HOME'], ".#{file}")
    unless template?(file)
      puts "Linking #{@dotfile}"
      FileUtils.ln_s(file, @dotfile, :force => force)
    end
  end

  def template?(file)
    Tilt.template_for(file)
  end

  def overwrite(file)
    case prompt(file)
    when 'a'
      @replace = true
      link(file, true)
    when 'y'
      link(file, true)
    when 'q'
      exit 1
    when 'n'
      puts "Skipping ~/.#{file}"
    else
      prompt
    end
  end

  def generate(file)
    case file
    when /.erb$/
      puts "Generating ~/.#{file.sub('.erb', '')}"
      path = File.join(ENV['HOME'], ".#{file.sub('.erb', '')}")
      template = Tilt.new(file).render(self)
      File.open(path, 'w') { |f| f.write template }
      File.chmod(0600, path) # We generally don't want the world to read our lovely configs
    end
  end

end
