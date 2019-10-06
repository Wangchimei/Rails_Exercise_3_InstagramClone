module FeedsHelper
  def button_text
    if action_name == "new" || action_name == "create" || action_name == "confirm"
        return "シェアする"
    elsif action_name == "edit"
        return "保存"
    end
  end
end

