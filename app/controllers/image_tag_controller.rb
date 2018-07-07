class ImageTagController < ApplicationController
  def image_tag
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
    algo = client.algo('deeplearning/IllustrationTagger/0.4.0')
    result = JSON.parse(algo.pipe(input).result)
    keys = result.dig("general").keys
    @tag_hashes = "#{keys}"

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("image_tag/image_tag.html.erb")
  end
end
