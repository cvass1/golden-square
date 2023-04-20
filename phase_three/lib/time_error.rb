require 'date'
require 'json'
require 'net/http'

class TimeError
  def initialize(requester = Net::HTTP, time_now = Time.now)
    @requester = requester
    @time_now = time_now
  end
  # Returns difference in seconds between server time
  # and the time on this computer
  def error
    return get_server_time - @time_now
  end

  private

  def get_server_time
    text_response = @requester.get(URI("https://worldtimeapi.org/api/ip"))
    # p text_response
    json = JSON.parse(text_response)
    # p json
    # p DateTime.parse(json["utc_datetime"]).to_time
    return DateTime.parse(json["utc_datetime"]).to_time
  end
end

