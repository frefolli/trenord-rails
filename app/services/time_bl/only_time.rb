module TimeBl
  class OnlyTime < ActiveInteraction::Base
    object :time, class: "Time"
    def execute
      return time.localtime.strftime("%H%M%S%N")
    end
  end
end
