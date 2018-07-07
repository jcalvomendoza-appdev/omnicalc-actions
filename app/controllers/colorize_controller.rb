class ColorizeController < ApplicationController
  def colorize
    input = {
      image: params.fetch("image_url")
    }

    # ================================================================================
    # Your code goes below.
    # ================================================================================

    @original_image_url = params.fetch("image_url")
    
    input = {
      image: @original_image_url
    }
    client = Algorithmia.client('sim1+75sf4SRsiBsPmq2getcJU41')
    algo = client.algo('deeplearning/ColorfulImageColorization/1.1.13')
    result = algo.pipe(input).result.dig("output")
    
    @colorized_image_url = "https://algorithmia.com/v1/data/#{result.gsub("data://","")}"

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("colorize/colorize.html.erb")
  end
end
