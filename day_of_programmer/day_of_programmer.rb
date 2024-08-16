# Marie invented a Time Machine and wants to test it by time-traveling to visit Russia on the Day of the Programmer (the 256th day of the year) 
# during a year in the inclusive range from 1700 to 2700.
# From 1700 to 1917, Russia's official calendar was the Julian calendar; since 1919 they used the Gregorian calendar system.
# The transition from the Julian to Gregorian calendar system occurred in 1918, when the next day after January 31st was February 14th. 
# This means that in 1918, February 14th was the 32nd day of the year in Russia.

# In both calendar systems, February is the only month with a variable amount of days; it has
# 29 days during a leap year, and 28 days during all other years. In the Julian calendar, leap
# years are divisible by 4; in the Gregorian calendar, leap years are either of the following:
# • Divisible by 400.
# • Divisible by 4 and not divisible by 100.

# Given a year, y, find the date of the 256th day of that year according to the official Russian calendar during that year. Then print it in the format dd. mm. yyyy, where dd is the two-digit day, mm is the two-digit month, and yyyy is y.
# For example, the given year = 1984. 1984 is divisible by 4, so it is a leap year. The 256th day
# of a leap year after 1918 is September 12, so the answer is 12.09. 1984.

# Complete the dayOfProgrammer function in the editor below. 
# It should return a string representing the date of the 256th day of the year given.

#
# Complete the 'dayOfProgrammer' function below.
#
# The function is expected to return a STRING.
# The function accepts INTEGER year as parameter.
#

def first_overcomplicated_solution(year)
    # Write your code here
    is_leap_year = year % 4 == 0 
    julean_years = (1700..1917).to_a
    is_juliean_year = julean_years.include?(year)

    days_per_month = {
        january: 31,
        february: 28,
        march: 31,
        april: 30,
        may: 31,
        june: 30,
        july: 31, 
        august: 30,
        september: 31,
        october: 30,
        november: 31,
        december: 30
    }

    if is_leap_year
        days_per_month[:february] = 29
    end

    days_per_year = days_per_month.values.sum

    # couldn't quite get there...
    'date'
end

def best_solution(year)
    is_transition_year = year == 1918

    is_julian_leap_year = year < 1918 && year % 4 == 0
    is_gregorian_leap_year = year > 1918 && (year % 400 == 0 || (year % 4 == 0 && year % 100 != 0))

    if is_transition_year
        day_of_programmer = "26.09.1918"
    elsif is_julian_leap_year || is_gregorian_leap_year
        day_of_programmer = "12.09.#{year}"
    else
        day_of_programmer = "13.09.#{year}"
    end

    day_of_programmer
end

def dayOfProgrammer(year)
    best_solution(year)
end

year1 = 2016
puts dayOfProgrammer(year1) # expect 12.09.2016

year2 = 1800
puts dayOfProgrammer(year2) # expect 12.09.1800
