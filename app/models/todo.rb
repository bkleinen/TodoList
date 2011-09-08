class Todo < ActiveRecord::Base
  belongs_to :user
  after_initialize :init
  def init
    self.status ||= false
  end
end
