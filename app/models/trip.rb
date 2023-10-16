class Trip < ApplicationRecord
  belongs_to :route
  belongs_to :calendar
end
