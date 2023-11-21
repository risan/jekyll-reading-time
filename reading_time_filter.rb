module ReadingTimeFilter
  include Liquid::StandardFilters

  def reading_time(input)
    # Get words count.
    total_words = get_plain_text(input).split.length

    # Load configuration.
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

    # Average reading words per minute.
    words_per_minute = 180

    # Calculate reading time.
    
    minutes = ((total_words / words_per_minute)+(0.9)).round
    return "#{minutes} #{minute_plural}";
  end

  def get_plain_text(input)
    strip_html(strip_pre_tags(input))
  end

  def strip_pre_tags(input)
    empty = ''.freeze
    input.to_s.gsub(/<pre(?:(?!<\/pre).|\s)*<\/pre>/mi, empty)
  end
end

Liquid::Template.register_filter(ReadingTimeFilter)
