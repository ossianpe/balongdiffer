class Balongdiffer
  def self.start(firstfile, secondfile)
    data = Data.new
    read = Balongdiffer::Read.new
    data.setfileone(read.readfile(firstfile))
    addresskeys = read.retrieveaddressnameskey(data.returnfileone)
    data.setaddresskeys(addresskeys)
    data.setfiletwo(read.readfile(secondfile))
    compare = Balongdiffer::Compare.new
    compare.difffiles(data.returnfileone, data.returnfiletwo, data.returnaddresskeys)
  end
end

require 'data/data'
require 'actions/compare/compare'
require 'actions/read/read'
