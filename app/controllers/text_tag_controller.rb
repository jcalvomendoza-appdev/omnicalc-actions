class TextTagController < ApplicationController
  def text_tag
    @text = params.fetch("text")

    # ================================================================================
    # Your code goes below.
    # ================================================================================

    client = Algorithmia.client('sim1+75sf4SRsiBsPmq2getcJU41')
    algo = client.algo('nlp/AutoTag/1.0.1')
    @tags = algo.pipe(@text).result


    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("text_tag/text_tag.html.erb")
  end
end
