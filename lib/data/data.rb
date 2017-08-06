class Balongdiffer::Data
  attr_accessor :fileAddresses, :addressNamesKey, :diffs
  #Constructor
  def initialize
    @fileAddresses
    @addressNamesKey = Array.new
    @diffs = Array.new
  end

  public

  def setfileaddresses(data)
    @fileAddresses = data
  end

  def setaddresskeys(addkeys)
    @addressNamesKey = addkeys
  end

  def setdiffs(diffs)
    @diffs = diffs
  end

  def returnfileaddresses
    return @fileAddresses
  end

  def returnaddresskeys
    return @addressNamesKey
  end

  def returndiffs
    return @diffs
  end
end
