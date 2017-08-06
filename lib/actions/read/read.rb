class Balongdiffer::Balongnvtool
  def initialize
    @fileOneAddresses
    @fileTwoAddresses
    @addressNamesKey = Array.new
  end

  #Retrieve the address arrays from the balong-nvtool
  def printaddressnames(filename)
    if filename.to_s.empty?
      puts "ERROR: No modem file given."
      puts "Please provide a modem file such as \"nv.bin\""
      exit(0)
    end

    require 'open3'
    cmd = Gem.loaded_specs['balongdiffer'].full_gem_path + "/ext/balong-nvtool -l #{filename}"
    Open3.popen3(cmd) do |stdin, stdout, stderr, thread|
      @fileTwoAddresses = stdout.read
    end
  end

  #If there is an associated Address Name, add the address identifier to an array.
  #  This array will later on be used for comparing the two modem files. Please note:
  #  the last line in this method assigns the output of the first file of addresses
  #  just to reduce logic.
  def retrieveaddressnameskey
    @fileTwoAddresses.each_line do |single_line|
      @addressNamesKey.push(single_line.split[0]) if single_line.split[5]
    end

    @fileOneAddresses = @fileTwoAddresses
    puts @addressNamesKey
  end
end
