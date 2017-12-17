require 'time'

module UtilityHelpers

  def get_current_time
    t = Time.now
    return t.httpdate
  end

  def get_fonts
    fonts = ["https://fonts.googleapis.com/icon?family=Material+Icons", "http://fonts.googleapis.com/css?family=Open+Sans:300,400,500,700"]
    Dir.foreach("source/assets/fonts/") do |font|
      if ![".", ".."].include? font.to_s
        fonts.push("/assets/fonts/#{font}")
      end
    end
    return fonts
  end

end
