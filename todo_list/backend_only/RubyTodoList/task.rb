
module RubyTodoList
  class Task
    VALID_STATUSES = ['completed', 'new']
  
    def initialize
      @description = 'nothing'
      @due_date = Date.today
      @status = 'new'
    end
  
    def set_description(input)
      if input.is_a? String
        @description = input
      else
        raise "Incorrect input format: #{input.class}"
      end
    end
  
    def set_due_date(input)
      if (input.is_a? String) || (input.is_a? Date)
        @due_date = input
      else
        raise "Incorrect input format: #{input.class}"
      end
    end
  
    def set_status(input)
      if (input.is_a? String) && VALID_STATUSES.include?(input)
        @status = input
      else
        raise "Incorrect status: #{input}"
      end
    end
  
    def print_task
      puts " * Description: #{@description}"
      puts " * Due Date: #{@due_date}"
      puts " * Status: #{@status}"
    end
  end
end
