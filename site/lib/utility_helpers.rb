require 'time'

module UtilityHelpers

  def get_current_time
    t = Time.now
    return t.httpdate
  end

end
