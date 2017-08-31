require 'balongdiffer'
require 'balongdiffer/actions/read/base'
require 'balongdiffer/actions/write/base'
require 'balongdiffer/data/file'

module BalongDiffer
  class Update
    # Updated the address name found in the first file with the one in the second
    def start(firstfile, secondfile, addressname)
      #Instatiate objects
      data = BalongDiffer::Data::File.new
      read = BalongDiffer::Read::Base.new

      #Save register of addresses for first and second files
      data.fileoneaddresses=read.loadfileaddress(firstfile)
      data.filetwoaddresses=read.loadfileaddress(secondfile)

      #Get the address offset location and length for both modems
      data.addressoneoffsetlocation, data.addressonelength=read.getoffsetandlength(data.fileoneaddresses, addressname)
      data.addresstwooffsetlocation, data.addresstwolength=read.getoffsetandlength(data.filetwoaddresses, addressname)

      puts data.addressoneoffsetlocation
      puts data.addresstwooffsetlocation

      #Read address offset
      data.addresstwooffset=read.readaddressoffset(secondfile, data.addressonelength, data.addressoneoffsetlocation)

      puts data.addresstwooffset
      #Read binary file, convert to hex, and save to data object
      # data.binaryfileone=read.readbinaryfile(firstfile)
      # puts data.binaryfileone

      #Determine index of address keys. This is determined by names found on
      #  addresses list pulled from first file. This will be used as an index
      #  to compare both files against.
      # addresskeys = read.retrieveaddressnameskey(data.returnfileaddresses)

      #Save index
      # data.setaddresskeys(addresskeys)

    end
  end
end
