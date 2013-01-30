def load_file

  profiles = Hash.new { |hash, key| hash[key] = []  }
  File.open("emp.csv", "r") do |f|
    f.each_line do |line|
      records = line.split(",").each { |entry| entry.chomp!}
      profiles[records[2]].push("#{records[0]} (Emp Id: #{records[1]})")
    end
  end
  write_file(profiles)
end

def write_file(profiles)
  File.open("designations.csv", "w") do |f|
    profiles.each_key do |keyvalue|
      f.puts keyvalue
      profiles.each_pair do |k, v|
        if k == keyvalue
          f.puts(v)
        end
      end
    end
  end
end
load_file  