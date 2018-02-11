class Skill < ApplicationRecord
  validates_presence_of :title, :percent_utilized
  include Placeholder
  after_initialize :set_defaults
  def set_defaults
    # self.main_image ||= "http://via.placeholder.com/600x200"
    # ========================>
    # self.main_image = self.main_image || "http://via.placeholder.com/600x200"
    # same as say if self.main_image == nil
    #                  self.main_image == "http://via.placeholder.com/600x200"
    #              end
    self.badge ||=  Placeholder.image_generator("250", "250")
  end
end
