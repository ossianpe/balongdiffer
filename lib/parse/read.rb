class Balongdiffer::Balongnvtool
  def printaddressnames(filename)
    cmd = Gem.loaded_specs['balongdiffer'].full_gem_path + "/ext/balong-nvtool -l #{filename}"
    value = `#{cmd}`
  end
end
