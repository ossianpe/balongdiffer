class Balongdiffer
  def self.start(firstfile, secondfile)
    addressnames = Balongnvtool.new
    addressnames.printaddressnames(firstfile)
    addressnames.retrieveaddressnameskey
    addressnames.printaddressnames(secondfile)
    addressnames.compare
  end
end

require 'actions/read/read'
require 'actions/compare/compare'
