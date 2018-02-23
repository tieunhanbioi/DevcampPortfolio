class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern

  def current_user
    super || OpenStruct.new(name: "Jordans Hudgens", first_name: "Guest", last_name: "Hudgens", email: "asdf@asdf.com")
  end
end
