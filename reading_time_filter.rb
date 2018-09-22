module ReadingTimeFilter
  def reading_time( input )
    # Strip multiline code blocks from word count
    # do not mutate original variable `input`
    text = input.dup
    re = /(?m)<pre .+?<\/pre>/
    text.gsub!(re, '')
    text = strip_html(text)
    # Get words count
    words = text.split.size
    # print words,"\n"

    # Average reading words per minute.
    words_per_minute = 180

    # Load configuration directive.
    config = @context.registers[:site].config["reading_time"]

    # Setup default value.
    if ! config
      second_plural = "seconds"
      minute_singular = "minute"
      minute_plural = "minutes"
    else
      second_plural = config["second_plural"] ? config["second_plural"] : "seconds"
      minute_singular = config["minute_singular"] ? config["minute_singular"] : "minute"
      minute_plural = config["minute_plural"] ? config["minute_plural"] : "minutes"
    end

    # Calculate reading time.
    case words
    when 0 .. 89
      return "30 #{second_plural}"
    when 90 .. 269
      return "1 #{minute_singular}"
    when 230 .. 449
      return "2 #{minute_plural}"
    when 450 .. 629
      return "3 #{minute_plural}"
    when 630 .. 809
      return "4 #{minute_plural}"
    when 810 .. 990
      return "5 #{minute_plural}"
    else
      minutes = ( words / words_per_minute ).floor
      return "#{minutes} #{minute_plural}";
    end
  end
end

Liquid::Template.register_filter(ReadingTimeFilter)
