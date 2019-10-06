module FeedsHelper
  def button_text
    if action_name == "new" || action_name == "create" || action_name == "confirm"
        return "シェアする"
    elsif action_name == "edit"
        return "保存"
    end
  end

  def new_or_edit
    if action_name == "new" || action_name == "create" || action_name == "confirm"
      confirm_feeds_path
    elsif action_name == "edit"
      feed_path
    end
  end

end

