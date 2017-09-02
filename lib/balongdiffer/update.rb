require 'balongdiffer'
require 'balongdiffer/actions/read/base'
require 'balongdiffer/actions/write/base'
require 'balongdiffer/actions/compare/base'
require 'balongdiffer/data/file'

module BalongDiffer
  class Update
    # Updated the address name found in the first file with the one in the second
    def start(firstfile, secondfile, addressname)
      #Instatiate objects
      data = BalongDiffer::Data::File.new
      read = BalongDiffer::Read::Base.new
      writ = BalongDiffer::Write::Base.new
      comp = BalongDiffer::Compare::Base.new

      #Save register of addresses for first and second files
      data.fileoneaddresses=read.loadfileaddress(firstfile)
      data.filetwoaddresses=read.loadfileaddress(secondfile)

      #Get the address offset location and length for both modems
      data.addressoneoffsetlocation, data.addressonelength=read.getoffsetandlength(data.fileoneaddresses, addressname)
      data.addresstwooffsetlocation, data.addresstwolength=read.getoffsetandlength(data.filetwoaddresses, addressname)

      #Read word
      data.wordone=read.readaddressoffset(firstfile, data.addressonelength, data.addressoneoffsetlocation)
      data.wordtwo=read.readaddressoffset(secondfile, data.addresstwolength, data.addresstwooffsetlocation)

      #Determine if the words from both files are the same
      data.issame=comp.diffwords(data.wordone, data.wordtwo)

      #Print results to screen for user
      writ.showdiff(data.issame, firstfile, data.wordone, secondfile, data.wordtwo)

      #Write the diff to the first file
      writ.writemodem(data.issame, firstfile, data.addressoneoffsetlocation, data.wordtwo)

      exit(0)
    end
  end
end
