require 'json'
require 'date'

class Event
  attr_reader :name, :start_date, :end_date, :event_rate
  def initialize(name, data)
    @name = name
    @start_date = Date.get_formatted_date(data["start"])
    @end_date = Date.get_formatted_date(data["end"])
    @event_rate = data["rate"].to_i
  end
end

class Hotel
  attr_reader :name, :rate, :events, :tax
  def initialize(info_hotel)
    @name = info_hotel["Hotel_name"]
    @rate = info_hotel["rate"]
    @events = []
    @tax = info_hotel["tax"]
    generate_event(info_hotel["seasonal_rates"])
  end

  def generate_event(events) #generate event only if "seasonal rates exists"
    if(!events.nil?)
      events.each do |event|
        event.each do |key, value|
          new_event = Event.new(key, value)
          @events.push(new_event)
        end
      end
    end
  end

  def check_event_exists(user_start_date, user_end_date, event_start_date, event_end_date)
    event_period = (event_start_date..event_end_date).to_a
    user_period = (user_start_date..user_end_date).to_a
    status = user_period.any? do |date|
      event_period.include?(date)
    end
    status
  end

  def get_days_of_stay(user_start_date, user_end_date, event_start_date, event_end_date)
    event_period = (event_start_date..event_end_date).to_a
    user_stay_period = (user_start_date..user_end_date).to_a
    if (event_period.include?(@start_date) && event_period.include?(@end_date))
      normal_days = 0
      event_days = user_stay_period.size
    else
      event_stay_dates = event_period & user_stay_period
      event_days = event_stay_dates.size
      normal_days = user_stay_period.size - event_days
    end
    return normal_days, event_days
  end

  def generate_output_during_event_stay(user_start_date, user_end_date, event_start_date, event_end_date, event)
    puts "Your stay falls in the #{event.name} event"
    normal_days, event_days = get_days_of_stay(user_start_date, user_end_date, event_start_date, event_end_date)
    puts "Normal Days of Stay : #{normal_days}"
    puts "Normal Rate : #{self.rate}"
    normal_bill = normal_days.to_i * self.rate.to_i
    puts "Number of days of stay during the event: #{event_days}"
    puts "Stay Rent During #{event.name} : #{event.event_rate}"
    event_bill = event_days.to_i * event.event_rate.to_i
    puts "Total Bill : #{total_bill = normal_bill + event_bill}"
    puts "Tax: #{self.tax}"
    puts "Net Bill (with Tax): #{(total_bill * (1 + self.tax.to_i / 100.0)).round(2)}"
    puts "*" * 50
  end

  def generate_output_during_normal_stay(total_days)
    puts "Hotel Rent: #{self.rate}"
    puts "Total Days of Stay: #{total_days}"
    puts "Total Bill: #{normal_bill = total_days * self.rate.to_i}"
    puts "Tax: #{self.tax}"
    puts "Net Bill (with Tax): #{(normal_bill * (1 + self.tax.to_i / 100.0)).round(2)}"
    puts "*" * 50
  end

  def calculate_rent(user_start_date, user_end_date)
    event_not_found = ""
    if(@events.length != 0)
      @events.each do |event|
        event_start_date = event.start_date
        event_end_date = event.end_date
        if(check_event_exists(user_start_date, user_end_date, event_start_date, event_end_date))
          generate_output_during_event_stay(user_start_date, user_end_date, event_start_date, event_end_date, event)
          return false
        else
          event_not_found = true
        end
      end
      if(event_not_found)
        total_days = (user_end_date - user_start_date).to_i + 1
        generate_output_during_normal_stay(total_days)
      end
    else
      total_days = (user_end_date - user_start_date).to_i + 1
      generate_output_during_normal_stay(total_days)
    end
  end
end

class Bill
  attr_accessor:hotel_array
  @@info_hotel
  def initialize #load data from json, store in @@info_hotel: call generate_hotel_objects
    @@info_hotel = load_hotel_data
    @hotel_array = []
    generate_hotel_objects
  end

  def load_hotel_data()
    JSON.parse(IO.read("hotels.json"))
  end

  def generate_hotel_objects 
    @@info_hotel.each do |h| #traverse through each entry in @@info_hotel
      hotel = Hotel.new(h) 
      @hotel_array.push(hotel)
    end
  end

  def get_rates #calls the calculate_rent fnc of the Hotel class passing params of start date & end date
    @hotel_array.each do |hotel|
      puts "Hotel Name : #{hotel.name}"
      hotel.calculate_rent(@start_date, @end_date)
    end
  end

  def get_dates #prompts to enter the date
    puts "Enter the start date (DD/MM/YYYY)"
    @start_date = gets.chomp
    @start_date = Date.parse(@start_date)
    puts "Enter The end Date (DD/MM/YYYY)"
    @end_date = gets.chomp
    @end_date = Date.parse(@end_date)
    if(@start_date > @end_date)
      puts "Invalid Dates Entered"
      exit(0)
    end
  end
end

def Date.get_formatted_date(date)
  current_year = Date.today.year
  temp_date = date + "-" + current_year.to_s
  if( Date.parse(temp_date) <= Date.today )
    temp_date = date + "-" + (current_year + 1).to_s
  end
  Date.parse(temp_date)
end


h = Bill.new
h.get_dates
h.get_rates
