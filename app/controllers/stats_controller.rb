class StatsController < ApplicationController
  def stats
    @numbers = params.fetch("list_of_numbers").gsub(",", "").split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = "#{@numbers.sort}"

    @count = "#{@numbers.length}"

    @minimum = "#{@numbers.min}"

    @maximum = "#{@numbers.max}"

    range = @numbers.max - @numbers.min
    @range = "#{range}"

    # Median
    # ======
    numbers = @numbers.sort
    if numbers.length%2 == 0
      median = (numbers[(numbers.length/2)-1]+numbers[(numbers.length/2)])/2
    else median = numbers[(numbers.length/2)]
    end

    @median = "#{median}"

    sum = 0
    @numbers.each do |num|
      sum = sum + num
    end
    @sum = "#{sum}"
    
    mean =  mean = sum/@numbers.length
    
    @mean = "#{mean}"

    # Variance
    # ========
  
    squared_differences = []
    
    numbers.each do |num|
    squared_difference = (num-mean)**2
    squared_differences.push(squared_difference)
    end
    
    sum_of_squared_differences = 0
    squared_differences.each do |num|
      sum_of_squared_differences = sum_of_squared_differences + num
    end
    
    variance = (sum_of_squared_differences/squared_differences.length)
    sd = (Math.sqrt(variance)).round(2)

    @variance = "#{variance}"

    @standard_deviation = "#{sd}"

    # Mode
    # ====
    
    counts = []
    numbers.each do |num|
      count = 0
      numbers.each do |comp|
        if num == comp
          count = count +1
        end
      end
      counts.push(count)
    end
    mode = numbers[counts.index(counts.max)]

    @mode = "#{mode}"

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("stats/stats.html.erb")
  end
end
