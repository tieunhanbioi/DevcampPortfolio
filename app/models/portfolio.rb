class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image
  def self.angular
    where(subtitle: "Angular")
  end

  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: "Ruby on Rails")}
  # after_initialize get called whenever a new instantiation of an
  # object occurs
  after_initialize :set_defaults
  def set_defaults
    # self.main_image ||= "http://via.placeholder.com/600x200"
    # ========================>
    # self.main_image = self.main_image || "http://via.placeholder.com/600x200"
    # same as say if self.main_image == nil
    #                  self.main_image == "http://via.placeholder.com/600x200"
    #              end
    self.main_image ||= "http://via.placeholder.com/600x200"
    self.thumb_image ||= "http://via.placeholder.com/350x150"
  end
end
