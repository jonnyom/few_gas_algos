class PingFrequency
  attr_accessor(:pings)

  def initialize
    @pings = Hash.new {|h, k| h[k] = [] }
  end

  def read_ping(ping)
    @pings[ping[0]] << ping[1]
  end

  def get_ping_frequency(user_id, frequency, start_time, end_time)
    user_pings = @pings[user_id]
    freq = frequency_map[frequency]
    windows = Array.new((end_time % freq) / 10, 0)
    user_pings.each do |ping|
      idx = (ping - start_time) / freq
      windows[idx] += 1 unless idx > windows.size
    end
    windows
  end

  private

  def frequency_map
    { 'hour' => 3600, 'minute' => 60, 'second' => 1 }
  end
end

pf = PingFrequency.new
pf.read_ping(["user_1", 5])
pf.read_ping(["user_2", 15])
pf.read_ping(["user_2", 20])
pf.read_ping(["user_1", 90])
pf.read_ping(["user_3", 100])
pf.read_ping(["user_1", 110])
pf.read_ping(["user_3", 120])
pf.read_ping(["user_3", 170])
pf.read_ping(["user_2", 2500])
pf.read_ping(["user_3", 3600])
pf.read_ping(["user_3", 3800])

p pf.get_ping_frequency("user_2", "minute", 0, 150)
