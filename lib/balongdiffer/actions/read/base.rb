module BalongDiffer::Read
  class Base
    #Retrieve the address arrays from the balong-nvtool
    def readfile(filename)
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
