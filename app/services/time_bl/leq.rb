module TimeBl
  class Leq < ActiveInteraction::Base
    object :left, class: "Time"
    object :right, class: "Time"
    def execute
      return OnlyTime.run!(time: left) <= OnlyTime.run!(time: right)
    end
  end
end
