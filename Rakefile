require 'bundler/setup'
require 'fileutils'
require 'yaml'
require 'base64'

require 'os'
require 'base64'
require 'rake'
require 'erubis'
require 'redcloth'
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
    @excluded = %w(Rakefile README.md LICENSE Gemfile Gemfile.lock config.yml ssh src)
    @files = (Dir['*'] - @excluded).sort
    # @files = (Dir['**/**'] - @excluded).sort
    # @files.delete_if { |f| @excluded.include? f.split('/')[0] }

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

      # If the file is identical, notify the user
      if File.identical?(file, @dotfile) 
        puts "Identical ~/.#{file}"

      # If the file is a template, generate it
      elsif template? file
        generate(file)

      # If the file already exists
      elsif File.exist?(@dotfile)

        # If we haven't already set the @replace var, prompt the user
        if !@replace
          overwrite(file)

        # We've had the @replace var set, so go ahead and overwrite
        elsif @replace
          link(file, true)
        end

      # The file doesn't exist, isn't a template, so go ahead and link it
      else
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
      FileUtils.ln_s("#{ENV['HOME']}/.dotfiles/#{file}", @dotfile, :force => force)
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
