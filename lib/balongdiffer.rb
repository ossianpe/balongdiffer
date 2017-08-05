class Balongdiffer
  def self.start(filename)
    addressnames = Balongnvtool.new
    addressnames.printaddressnames(filename)
  end
end

class Balongdiffer::Balongnvtool
  def initialize
    unless File.exist?(Gem.loaded_specs['balongdiffer'].full_gem_path + "/ext/balong-nvtool/modem-bin/balong-nvtool")
      build_cmd = ["gcc -O2  -Wunused -Wno-unused-result -D BUILDNO=129 -c -o balong-nvtool.o balong-nvtool.c",
                   "gcc -O2  -Wunused -Wno-unused-result -D BUILDNO=129 -c -o nvio.o nvio.c",
                   "gcc -O2  -Wunused -Wno-unused-result -D BUILDNO=129 -c -o nvid.o nvid.c",
                   "gcc -O2  -Wunused -Wno-unused-result -D BUILDNO=129 -c -o sha2.o sha2.c",
                   "gcc -O2  -Wunused -Wno-unused-result -D BUILDNO=129 -c -o nvcrc.o nvcrc.c",
                   "gcc balong-nvtool.o nvio.o nvid.o sha2.o nvcrc.o -o balong-nvtool"]
      Dir.chdir(Gem.loaded_specs['balongdiffer'].full_gem_path + "/ext/balong-nvtool")
      build_cmd.each do |single_cmd|
        `#{single_cmd}`
      end
    end
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
