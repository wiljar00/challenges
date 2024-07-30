# Given a time in -hour AM/PM format, convert it to military (24-hour) time.
# Note: - 12:00:00AM on a 12-hour clock is 00:00:00 on a 24-hour clock.
#       - 12:00:00PM on a 12-hour clock is 12:00:00 on a 24-hour clock.

# Complete the 'timeConversion' function below.
#
# The function is expected to return a STRING.
# The function accepts STRING s as parameter.
#

def first_solution(s)
    hour = s[0..1]
    minute = s[3..4]
    second = s[6..7]
    am_pm = s[8..9]

    if am_pm == 'PM'
        hour = hour.to_i + 12
        if hour.to_i == 24
            hour = "12"
        end
    end

    if am_pm == 'AM'
        if hour.to_i == 12
            hour = "00"
        end
    end

    "#{hour}:#{minute}:#{second}"
end

def second_solution(s)
    hour = s[0..1].to_i
    minute = s[3..4]
    second = s[6..7]
    period = s[8..9]
  
    if period == "AM"
      hour = 0 if hour == 12
    else
      hour += 12 if hour != 12
    end
  
    hour_str = hour.to_s.rjust(2, '0')
    "#{hour_str}:#{minute}:#{second}"
end

def ruby_cheat_solution(s)
    require 'Time'

    # Parse the time string into a Time object
    time = Time.strptime(s, "%I:%M:%S%p")

    # Format the Time object into a 24-hour time string
    time.strftime("%H:%M:%S")
end

def timeConversion(s)
    # Write your code here

    time = first_solution(s)
    # time = second_solution(s)
    # time = ruby_cheat_solution(s)
    time
end

time = "12:01:00PM"
puts timeConversion(time) # expected result: '12:01:00'

time2 = "12:01:00AM"
puts timeConversion(time2) # expected result: '00:01:00'

time3 = "07:05:45PM"
puts timeConversion(time3) # expected result: '19:05:45'