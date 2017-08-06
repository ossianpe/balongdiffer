Gem::Specification.new do |s|
  s.name        = 'balongdiffer'
  s.version     = '0.6.0'
  s.executables << 'balongdiffer'
  s.date        = '2017-08-05'
  s.summary     = "Prints diffs between two balong nv.bin files"
  s.description = "Prints the names of address fields that differ between two balong nv.bin files."
  s.authors     = ["Peter Ossian"]
  s.email       = 'msuossianpe@gmail.com'
  s.files       = ["lib/balongdiffer.rb",
                   "lib/data/data.rb",
                   "lib/actions/read/read.rb",
                   "lib/actions/compare/compare.rb",
                   "ext/balong-nvtool"]
  s.homepage    =
    'http://rubygems.org/gems/balongdiffer'
end
