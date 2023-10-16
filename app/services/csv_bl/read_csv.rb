require "csv"

module CsvBl
  class ReadCsv < ActiveInteraction::Base
    string :text
    def execute()
      csv = CSV.new(text)
      header = csv.shift
      rows = csv.read
      return {:header => header, :rows => rows}
    end
  end
end
