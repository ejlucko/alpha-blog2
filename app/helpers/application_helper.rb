module ApplicationHelper
<<<<<<< HEAD

  def gravatar_for(user, options = {size: 80})
    email_address = user.email.downcase
    hash = Digest::MD5.hexdigest(email_address)
    size = options[:size]
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "rounded mx-auto d-block shadow")
  end

  def current_user
    @currentuser ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end
  
=======
>>>>>>> parent of 6a8c527... Add users show page
end
