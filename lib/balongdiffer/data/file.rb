module BalongDiffer::Data
  class File
    attr_accessor :fileoneaddresses, :filetwoaddresses, :wordname, :addressoneoffsetlocation,
      :addresstwooffsetlocation, :addressonelength, :addresstwolength, :wordone,
      :wordtwo, :issame
    #Constructor
    def initialize
      @fileoneaddresses = String.new
      @filetwoaddresses = String.new
      @wordname = String.new
    end
  end
end
