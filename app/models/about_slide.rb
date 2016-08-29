class AboutSlide < ActiveRecord::Base
  SLIDE_CLASSES = [AboutSlide, ContactSlide]

  before_create :set_id
  def set_id
    last_id = 0
    self.id = last_id + 1
  end
end
