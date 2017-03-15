class Company
  def initialize(task)
    @tasks, @results = Queue.new, Queue.new

    @tasks.push(task)
  end

  def run
    manager = Thread.new { manager_routine }
    employee = Thread.new { employee_routine }

    sleep 6

    go_home(manager)
    go_home(employee)
  end

  #
  # An employee doing his thing
  #
  def employee_routine
    loop do
      if @tasks.empty?
        have_a_break(0.1)
      else
        @results << work_hard(@tasks.pop)
      end
    end
  end

  #
  # A manager doing his thing
  #
  def manager_routine
    loop do
      if @results.empty?
        have_a_break(1)
      else
        show_off(@results.pop)
        # @tasks << 20
      end
    end
  end

  private

  def show_off(result)
    puts result
  end

  def work_hard(task)
    task ** task
  end

  def have_a_break(amount)
    sleep amount
  end

  def go_home(person)
    person.kill
  end
end

Company.new(10).run
