# Given a time in -hour AM/PM format, convert it to military (24-hour) time.
# Note: - 12:00:00AM on a 12-hour clock is 00:00:00 on a 24-hour clock.
#       - 12:00:00PM on a 12-hour clock is 12:00:00 on a 24-hour clock.

# Complete the 'timeConversion' function below.
#
# The function is expected to return a STRING.
# The function accepts STRING s as parameter.
#

def timeConversion(s)
    # Write your code here

end

time = "12:01:00PM"
puts timeConversion(time) # expected result: '12:01:00'

time2 = "12:01:00AM"
puts timeConversion(time2) # expected result: '00:01:00'