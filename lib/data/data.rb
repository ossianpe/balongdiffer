class Balongdiffer::Data
  attr_accessor :fileOneAddresses, :fileTwoAddresses, :addressNamesKey
  #Constructor
  def initialize
    @fileOneAddresses
    @fileTwoAddresses
    @addressNamesKey = Array.new
  end

  public

  def setfileone(data)
    @fileOneAddresses = data
  end

  def setfiletwo(data)
    @fileTwoAddresses = data
  end

  def setaddresskeys(addkeys)
    @addressNamesKey
  end

  def returnfileone
    return @fileOneAddresses
  end

  def returnfiletwo
    return @fileTwoAddresses
  end

  def returnaddresskeys
    return @addressNamesKey
  end
end
