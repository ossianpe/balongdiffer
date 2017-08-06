class Balongdiffer
  def self.start(firstfile, secondfile)
    #Instatiate objects
    data = Data.new
    read = Balongdiffer::Read.new
    compare = Balongdiffer::Compare.new

    #Save register of addresses
    data.setfileaddresses(read.readfile(firstfile))

    #Determine index of address keys. This is determined by names found on
    #  addresses list pulled from first file. This will be used as an index
    #  to compare both files against.
    addresskeys = read.retrieveaddressnameskey(data.returnfileaddresses)

    #Save index
    data.setaddresskeys(addresskeys)

    #Diff the two files only at values determined by the index
    compare.difffiles(firstfile, secondfile, data.returnaddresskeys)
  end
end

require 'data/data'
require 'actions/compare/compare'
require 'actions/read/read'
