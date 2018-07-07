class WordCountController < ApplicationController
  def word_count
    @text = params.fetch("user_text")
    @special_word = params.fetch("user_word")

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================

    @word_count = "#{@text.split.size}"

    @character_count_with_spaces = "#{@text.strip.length}"

    @character_count_without_spaces = "#{@text.strip.gsub(/\s+/, "").length}"

    @occurrences = "#{@text.downcase.scan(@special_word.downcase.strip).count}"

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("word_count/word_count.html.erb")
  end
end
