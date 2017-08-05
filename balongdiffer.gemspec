Gem::Specification.new do |s|
  s.name        = 'balongdiffer'
  s.version     = '0.2.4'
  s.executables << 'balongdiffer'
  s.date        = '2017-08-05'
  s.summary     = "Prints diffs between two balong nv.bin files"
  s.description = "Prints the names of address fields that differ between two balong nv.bin files."
  s.authors     = ["Peter Ossian"]
  s.email       = 'msuossianpe@gmail.com'
  s.files       = ["lib/balongdiffer.rb", "lib/parse/read.rb", "ext/balong-nvtool"]
  s.homepage    =
    'http://rubygems.org/gems/balongdiffer'
end
