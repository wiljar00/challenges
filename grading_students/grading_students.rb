# HackerLand University has the following grading policy:
#  - Every student receives a grade in the inclusive range from 0 to 100.
#  - Any grade less than 40 is a failing grade.
# Sam is a professor at the university and likes to round each student's grade according to these rules:
#  - If the difference between the grade and the next multiple of 5 is less than 3, round grade up to the next multiple of 5.
#  - If the value of grade is less than 38, no rounding occurs as the result will still be a failing grade.

# Examples:
#   84 rounds to 85 (85 - 84 is less than 3)
#   29 does not round (result is less than 40)
#   57 does not round (60 - 57 is 3 or higher)

# Given the initial value of  for each of Sam's  students, write code to automate the rounding process.

# Complete the 'gradingStudents' function below.
#
# The function is expected to return an INTEGER_ARRAY.
# The function accepts INTEGER_ARRAY grades as parameter.
#

def gradingStudents(grades)
    # grades is an integer array
    result = []

    grades.each do |grade|
      if grade < 38
        result << grade
      else
        next_multiple_of_5 = ((grade / 5) + 1) * 5
        if next_multiple_of_5 - grade < 3
          result << next_multiple_of_5
        else
          result << grade
        end
      end
    end

    # returns integer array
    result 
end

grades = [73, 67, 38, 33]
puts gradingStudents(grades) # expect: [75, 67, 40, 33]