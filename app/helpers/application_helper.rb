module ApplicationHelper
  def avatar(user, type)
  @avatar = user.avatar.url
    if @avatar.nil?
      @avatar_user = image_tag("default_user.png", alt:user.name, class: "#{type}", id:"imgProfile")
    else
      avatar_thumb = user.avatar.url :thumb
      @avatar_user = image_tag(avatar_thumb, alt:user.name, class: "#{type}", id:"imgProfile")
    end
    @avatar_user
  end
end
