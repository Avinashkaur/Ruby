def load_file
  profiles = Hash.new { |hash, key| hash[key] = []  }
  IO.foreach("emp.csv") do |line|
    records = line.split(",").each { |entry| entry.chomp! }
    profiles[records[2]].push("#{records[0]} (Emp Id: #{records[1]})")
  end
  write_file(profiles)
end

def write_file(profiles)
  File.open("designations.csv", "w") do |line|
    profiles.each_key do |keyname|
      line.puts keyname
      profiles.each_pair do |key, value|
        if key == keyname
          line.puts(value)
        end
      end
    end
  end
end
load_file  