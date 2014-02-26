class TimeClock < ActiveRecord::Base
  belongs_to :user

  def start(user)
    self.user    = user
    self.started = Time.now
    self.active  = true
    self.save
  end

  def stop
    self.ended  = Time.now
    self.active = false
    self.save
  end
end
