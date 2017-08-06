class Balongdiffer::Write
  #Write diffs to a file
  def writeoutput(data)
    if data.to_s.empty?
      puts "No diffs were found."
      exit(0)
    end

    require 'open3'
    Open3.popen3(cmd) do |stdin, stdout, stderr, thread|
      return stdout.read
    end
  end
end
