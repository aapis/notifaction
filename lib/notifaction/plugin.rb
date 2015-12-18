module Notifaction
  module Plugin
    def self.num_lines(file)
      File.foreach(file).inject(0) {|c, line| c+1}
    end
  end
end