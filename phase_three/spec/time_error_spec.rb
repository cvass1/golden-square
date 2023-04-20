require 'time_error'

RSpec.describe TimeError do 
  it "should return the time difference" do
    fake_requestter = double(:requester)
    fake_time = Time.new(2023, 04, 20, 14, 17, 26, "+00:00") 
    expect(fake_requestter).to receive(:get).with(
      URI("https://worldtimeapi.org/api/ip")
    ).and_return('{"abbreviation":"BST","client_ip":"2.125.199.94",
      "datetime":"2023-04-20T14:17:26.209271+01:00","day_of_week":4,
      "day_of_year":110,"dst":true,"dst_from":"2023-03-26T01:00:00+00:00",
      "dst_offset":3600,"dst_until":"2023-10-29T01:00:00+00:00","raw_offset":0,
      "timezone":"Europe/London","unixtime":1681999808,
      "utc_datetime":"2023-04-20T14:17:26.209271+00:00","utc_offset":"+01:00","week_number":16}')
    # expect(fake_time)
    time_error = TimeError.new(fake_requestter, fake_time)
    expect(time_error.error).to eq(0.209271)
  end
end

# 2023-04-20 14:17:26.209271 +0000 #server_time_fixed
# 2023-04-20 15:17:25.964205 +0100 #time_now_fixed
# 0.245036 #difference