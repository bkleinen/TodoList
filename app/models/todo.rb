class Todo < ActiveRecord::Base
  after_initialize :init
  def init
    self.status ||= false
  end
end
