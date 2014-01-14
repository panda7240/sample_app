module UsersHelper

  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user)
    if user.email !=nil
      gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    else
      gravatar_id = 0
    end
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

end
