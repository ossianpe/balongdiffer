class Balongdiffer::Compare
  def difffiles(fileone, filetwo, addresskeys)
    print "address keys loaded!..ready to diff"
    # addresskeys.each do |key|
    # end
  end

  def balongnvtool(file, key)
    require 'open3'
    cmd = Gem.loaded_specs['balongdiffer'].full_gem_path + "/ext/balong-nvtool -l #{filename}"
    output = String.new
    Open3.popen3(cmd) do |stdin, stdout, stderr, thread|
      return stdout.read
    end
  end
end
