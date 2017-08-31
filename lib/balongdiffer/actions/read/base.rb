class String
  def convert_base(from, to)
    self.to_i(from).to_s(to)
    # works up-to base 36
  end
end

module BalongDiffer::Read
  class Base
    #Reads address location in modem bin file into memory
    def readaddressoffset(filename, length, offset)
      #TODO fix garbled output
      decoffset=offset.convert_base(16, 10).to_i
      totallength=length.to_i + decoffset
      s = File.binread(filename, totallength, decoffset)
      return bits = s.unpack("H*") # "01011111010110111000111000010011"
    end

    #Retrieve the address arrays from the balong-nvtool
    def loadfileaddress(filename)
      if filename.to_s.empty?
        puts "ERROR: No modem file given."
        puts "Please provide a modem file such as \"nv.bin\""
        exit(0)
      end

      require 'open3'
      cmd = Gem.loaded_specs['balongdiffer'].full_gem_path + "/ext/balong-nvtool -l #{filename}"
      output = String.new
      Open3.popen3(cmd) do |stdin, stdout, stderr, thread|
        return stdout.read
      end
    end

    #Retrieve the address for a given Address name
    def getoffsetandlength(fileaddresses, addressname)
      fileaddresses.each_line { |line|
        if line =~ /#{addressname}/ then
          #Return offset and length
          return [line.split[2], line.split[3]]
        end
      }
      puts "ERROR: Address Name '#{addressname}' not found."
      exit(0)
    end

    #If there is an associated Address Name, add the address identifier to an array.
    #  This array will later on be used for comparing the two modem files.
    def retrieveaddressnameskey(fileonedata)
      arr = Array.new
      fileonedata.each_line.with_index do |single_line, index|
        arr.push(single_line.split[0]) if (single_line.split[5] && index>20)
      end
      return arr
    end
  end
end
