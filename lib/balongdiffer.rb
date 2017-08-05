class Balongdiffer
  def self.start(filename)
    addressnames = Balongnvtool.new
    addressnames.printaddressnames(filename)
  end
end

class Balongdiffer::Balongnvtool
  def initialize
    cmd = Gem.loaded_specs['balongdiffer'].full_gem_path + "/ext/balong-nvtool/make"
    value = `#{cmd}`
  end
  def printaddressnames(filename)
    if filename.to_s.empty?
      puts "ERROR: No modem file given."
      puts "Please provide a modem file such as \"nv.bin\""
      exit(0)
    end
    cmd = Gem.loaded_specs['balongdiffer'].full_gem_path + "/ext/balong-nvtool/modem-bin/balong-nvtool -l #{filename}"
    value = `#{cmd}`
  end
end
