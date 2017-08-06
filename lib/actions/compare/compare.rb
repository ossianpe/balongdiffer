class Balongdiffer::Compare
  #Get the diffs between the two files at the indexies
  def difffiles(fileone, filetwo, addresskeys)
    fileoneresult = String.new
    filetworesult = String.new
    arry = Array.new
    addresskeys.each do |key|
      fileoneresult = balongnvtool(fileone, key)
      filetworesult = balongnvtool(filetwo, key)
      unless fileoneresult.eql? filetworesult
        #Determine the name of the feild that has a diff
        arry.push(getdifname(fileoneresult))
      end
    end
    puts arry
    return arry
  end

  def balongnvtool(filename, key)
    require 'open3'
    cmd = Gem.loaded_specs['balongdiffer'].full_gem_path + "/ext/balong-nvtool -d #{key} #{filename}"
    output = String.new
    Open3.popen3(cmd) do |stdin, stdout, stderr, thread|
      return stdout.read
    end
  end

  def getdifname(resultone)
    resultone.each_line do |single_line|
      if single_line.split[12]
        return single_line.split[12]
      end
    end
  end
end
