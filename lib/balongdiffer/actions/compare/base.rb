module BalongDiffer::Compare
  class Base
    def diffwords(wordone, wordtwo)
      return wordone.eql? wordtwo
    end
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
      cleanedarry = removebandspecificaddresses(arry)
      puts cleanedarry
      return cleanedarry
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

    def removebandspecificaddresses(array)
      array.each do |x|
        ending_chars = x.split("_").last.to_s
        for i in 0..128
          if ending_chars == "B#{i}"
            array.delete(x)
            break
          end
        end
      end
      return array
    end
  end
end
