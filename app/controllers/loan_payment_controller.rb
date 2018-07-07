class LoanPaymentController < ApplicationController
  def loan_payment
    @apr = params.fetch("annual_percentage_rate").to_f
    @years = params.fetch("number_of_years").to_i
    @principal = params.fetch("principal_value").to_f

    # ================================================================================
    # Your code goes below.
    # The annual percentage rate the user input is in the decimal @apr.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================

    monthly_payment = ((((@apr/100)/12)*@principal)/(1-(1+((@apr/100)/12))**(@years*-12))).round(2)

    @monthly_payment = "#{monthly_payment}"

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("loan_payment/loan_payment.html.erb")
  end
end
