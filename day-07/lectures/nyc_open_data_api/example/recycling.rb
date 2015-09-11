require_relative 'recycle_bin'
RecycleBin.new.puts_each_address
puts RecycleBin.new.find_by_borough("Brooklyn")