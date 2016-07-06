module Notifaction
  module Style

    @map = {
      colour: {
        red: 31,
        green: 32,
        yellow: 33,
        blue: 34,
        magenta: 35,
        cyan: 36,
        white: 37,
        null: 0
      },
      style: {
        reset: 0,
        bold: 1,
        underline: 4,
        normal: ""
      }
    }

    def self.format(message, colour = nil, style = nil)
      c = @map[:colour][colour.to_sym] unless colour.nil?

      if style.nil?
        t = 0
      else
        t = @map[:style][style.to_sym]
      end

      "\e[#{t};#{c}m#{message}\e[0m"
    end

  end
end