module CsvBl
  class ReadFile < ActiveInteraction::Base
    string :path
    def execute()
      CsvBl::ReadCsv.run!(text: File.open(path).read)
    end
  end
end
