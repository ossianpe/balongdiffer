class Balongdiffer
  def self.start(filename)
    addressnames = Balongnvtool.new
    addressnames.printaddressnames(filename)
  end
end

require 'parse/read'
