IRB.conf[:HISTORY_FILE] = "~/.history/irb-history"
IRB.conf[:SAVE_HISTORY] = 1000

class Object
  # Return only the methods not present on basic objects
  def interesting_methods
    (self.methods - Object.instance_methods).sort
  end
end

require 'pry'
Pry.start
exit
