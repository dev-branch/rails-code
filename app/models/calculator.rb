class Calculator
  def initialize(problem)
    a, op, b = problem.split
    @a = a.to_f
    @b = b.to_f
    @op = op

    answer
  end

  def answer
    @answer = case @op
    when '**'
      @a ** @b
    when '*'
      @a * @b
    when '/'
      @a / @b
    when '+'
      @a + @b
    when '-'
      @a - @b
    end
  end

  def to_s
    "#{@a} #{@op} #{@b} = #{@answer}"
  end

  def Calculator.write(obj, filename)
    open(filename, 'a') do |f|
      f.puts obj
    end
  end

  def Calculator.read(filename)
    begin
      File.readlines(filename)
    rescue Errno::ENOENT => e
      []
    end
  end

  def Calculator.delete(filename)
    File.delete(filename) if File.exist?(filename)
  end
end
