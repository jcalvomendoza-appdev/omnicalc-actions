class TimeBetweenController < ApplicationController
  def time_between
    @starting = Chronic.parse(params.fetch("starting_time"))
    @ending = Chronic.parse(params.fetch("ending_time"))

    # ================================================================================
    # Your code goes below.
    # The start time is in the Time @starting.
    # The end time is in the Time @ending.
    # Note: Ruby stores Times in terms of seconds since Jan 1, 1970.
    #   So if you subtract one time from another, you will get an integer
    #   number of seconds as a result.
    # ================================================================================
    
    seconds = (@ending-@starting)
    minutes = (seconds/60)
    hours = (seconds/3600)
    days = (hours/24)
    weeks = (days/7)
    years = (days/364)
    
    @seconds = "#{seconds}"
    @minutes = "#{minutes}"
    @hours = "#{hours}"
    @days = "#{days}"
    @weeks = "#{weeks}"
    @years = "#{years}"

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("time_between/time_between.html.erb")
  end
end
