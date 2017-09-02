module BalongDiffer::Write
  class Base
    #Write data from second file to the first file if user accepts prompt
    def writemodem(isthesame, thefirstfile, thefirstwordoffset, thesecondword)
      if isthesame != true
        puts "The content is different. Write diff to the first file (#{thefirstfile})?"
        puts "y/Y for yes. Any other response will cancel operation."
        answer=$stdin.gets.chomp
        if ['y','Y'].include? answer
          puts "Writing diff to #{thefirstfile}.."
          decfirstwordoffset=thefirstwordoffset.convert_base(16, 10).to_i
          #Pack the word back into binary form
          packedsecondword=thesecondword.pack('H*')
          s = File.binwrite(thefirstfile, packedsecondword, decfirstwordoffset)
          puts "Wrote diff of length #{s} to #{thefirstfile}."
          return
        end
        puts "Did not write to #{thefirstfile}."
        return
      else
        puts "Content is the same. Nothing to do."
        return
      end
    end
    #Prints to screen if diff, otherwise truncates results
    def showdiff(isthesame, thefirstfile, thefirstword, thesecondfile, thesecondword)
      if isthesame
        puts "#{thefirstfile} & #{thesecondfile}"
        puts thefirstword
      else
        puts thefirstfile, thefirstword
        puts thesecondfile, thesecondword
      end
    end
    #Write diffs to a file
    def writeoutput(data)
      if data.to_s.empty?
        puts "No diffs were found."
        exit(0)
      end

      Open3.popen3(cmd) do |stdin, stdout, stderr|
        stdin.puts "y\r\n"

        stdout.each_line { |line| puts line }
        stdin.close
      end

      require 'open3'
      Open3.popen3(cmd) do |stdin, stdout, stderr, thread|
        return stdout.read
      end
    end
  end
end
