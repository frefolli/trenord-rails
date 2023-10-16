module TimeBl
  class AsTimestamp < ActiveInteraction::Base
    object :time, class: "Time"
    def execute
      return time.localtime.strftime("%H:%M:%S")
    end
  end
end
