class Balongdiffer
  def self.start(filename)
    addressnames = Balongnvtool.new
    addressnames.printaddressnames(filename)
  end
end

class Balongdiffer::Balongnvtool
  def printaddressnames(filename)
    if filename.to_s.empty?
      puts "ERROR: No modem file given."
      puts "Please provide a modem file such as \"nv.bin\""
      exit(0)
    end

    require 'open3'
    cmd = Gem.loaded_specs['balongdiffer'].full_gem_path + "/ext/balong-nvtool -l #{filename}"
    Open3.popen3(cmd) do |stdin, stdout, stderr, thread|
      puts stdout.read
    end
  end
end
