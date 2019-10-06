module ApplicationHelper
  def avatar(user, type)
  @avatar = user.avatar
    if @avatar.nil?
      @avatar_user = image_tag("default_user.png", alt:user.name, class: "#{type}")
    else
      @avatar_user = image_tag(@avatar.url, alt:user.name, class: "#{type}")
    end
    @avatar_user
  end
end
