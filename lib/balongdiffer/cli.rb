require 'balongdiffer'
require 'balongdiffer/actions/read/base'
require 'balongdiffer/actions/write/base'
require 'balongdiffer/actions/compare/base'
require 'balongdiffer/data/base'

module BalongDiffer
  class CLI
    def start(firstfile, secondfile)
      #Instatiate objects
      data = BalongDiffer::Data::Base.new
      read = BalongDiffer::Read::Base.new
      compare = BalongDiffer::Compare::Base.new

      #Save register of addresses
      data.setfileaddresses(read.loadfileaddress(firstfile))

      #Determine index of address keys. This is determined by names found on
      #  addresses list pulled from first file. This will be used as an index
      #  to compare both files against.
      addresskeys = read.retrieveaddressnameskey(data.returnfileaddresses)

      #Save index
      data.setaddresskeys(addresskeys)

      #Diff the two files only at values determined by the index
      diffs = compare.difffiles(firstfile, secondfile, data.returnaddresskeys)

      #Save diffs
      data.setdiffs(diffs)
    end
  end
end
